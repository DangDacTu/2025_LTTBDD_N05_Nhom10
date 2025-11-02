import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:easy_localization/easy_localization.dart';
import '../models/audiobook.dart';

class PlayerScreen extends StatefulWidget {
  final AudioBook book;
  const PlayerScreen({super.key, required this.book});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen>
    with SingleTickerProviderStateMixin {
  final AudioPlayer _player = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  late AnimationController _rotationController;

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 12),
    );

    _player.onPlayerStateChanged.listen((state) {
      setState(() => isPlaying = state == PlayerState.playing);
      if (isPlaying) {
        _rotationController.repeat();
      } else {
        _rotationController.stop(canceled: false);
      }
    });

    _player.onDurationChanged.listen((d) => setState(() => duration = d));
    _player.onPositionChanged.listen((p) => setState(() => position = p));
  }

  @override
  void dispose() {
    _player.dispose();
    _rotationController.dispose();
    super.dispose();
  }

  Future<void> _togglePlay() async {
    try {
      if (isPlaying) {
        await _player.pause();
      } else {
        if (kIsWeb) {
          await _player.play(UrlSource('/assets/audios/${widget.book.audioUrl}'));
        } else {
          await _player.play(AssetSource('audios/${widget.book.audioUrl}'));
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${'audio_error'.tr()}: $e')),
      );
    }
  }

  String _format(Duration d) {
    final mm = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final ss = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '${d.inHours > 0 ? '${d.inHours}:' : ''}$mm:$ss';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F29),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          widget.book.title,
          style: const TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1B1B3A), Color(0xFF0F0F29)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 💿 Đĩa xoay
            AnimatedBuilder(
              animation: _rotationController,
              builder: (_, child) {
                return Transform.rotate(
                  angle: _rotationController.value * 2 * math.pi,
                  child: child,
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const SweepGradient(
                    colors: [
                      Color(0xFF8A56FF),
                      Color(0xFF5C5CE0),
                      Color(0xFF8A56FF),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.deepPurpleAccent.withOpacity(0.5),
                      blurRadius: 25,
                      spreadRadius: 3,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(10),
                child: ClipOval(
                  child: Image.asset(
                    widget.book.coverUrl,
                    height: 260,
                    width: 260,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => const Icon(
                      Icons.image_not_supported,
                      color: Colors.white54,
                      size: 100,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),

            Text(
              widget.book.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.book.author,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 30),

            Slider(
              activeColor: const Color(0xFF7C4DFF),
              inactiveColor: Colors.grey[700],
              min: 0,
              max: duration.inMilliseconds.toDouble(),
              value: position.inMilliseconds
                  .clamp(0, duration.inMilliseconds)
                  .toDouble(),
              onChanged: (value) async {
                final pos = Duration(milliseconds: value.toInt());
                await _player.seek(pos);
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(_format(position),
                    style: const TextStyle(color: Colors.white70)),
                Text(_format(duration),
                    style: const TextStyle(color: Colors.white70)),
              ],
            ),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  tooltip: 'rewind'.tr(),
                  iconSize: 36,
                  color: Colors.white70,
                  icon: const Icon(Icons.replay_10),
                  onPressed: () async {
                    final newPos = position - const Duration(seconds: 10);
                    await _player.seek(
                        newPos >= Duration.zero ? newPos : Duration.zero);
                  },
                ),
                const SizedBox(width: 20),
                GestureDetector(
                  onTap: _togglePlay,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: isPlaying
                            ? [const Color(0xFF7C4DFF), const Color(0xFFB892FF)]
                            : [const Color(0xFF3A3A75), const Color(0xFF5C5CE0)],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.purpleAccent.withOpacity(0.4),
                          blurRadius: 20,
                          spreadRadius: 3,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Icon(
                      isPlaying
                          ? Icons.pause_rounded
                          : Icons.play_arrow_rounded,
                      color: Colors.white,
                      size: 80,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                IconButton(
                  tooltip: 'forward'.tr(),
                  iconSize: 36,
                  color: Colors.white70,
                  icon: const Icon(Icons.forward_10),
                  onPressed: () async {
                    final newPos = position + const Duration(seconds: 10);
                    if (newPos < duration) await _player.seek(newPos);
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              isPlaying ? 'playing'.tr() : 'paused'.tr(),
              style: const TextStyle(color: Colors.white54, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
