import 'package:flutter/material.dart';
import 'package:tridaya_travel/views/home.dart';

class WaktuShalat extends StatefulWidget {
  const WaktuShalat({super.key});

  @override
  State<WaktuShalat> createState() => _WaktuShalatState();
}

class _WaktuShalatState extends State<WaktuShalat> {
 // Dummy data for prayer times
  final List<Map<String, dynamic>> _prayerTimes = [
    {
      'name': 'Subuh',
      'time': '04:49 WIB',
      'icon': Icons.wb_sunny_outlined,
      'isCurrent': false,
    },
    {
      'name': 'Dzuhur',
      'time': '12:10 WIB',
      'icon': Icons.wb_sunny,
      'isCurrent': false,
    },
    {
      'name': 'Ashar',
      'time': '15:32 WIB',
      'icon': Icons.cloudy_snowing,
      'isCurrent': false,
    },
    {
      'name': 'Maghrib',
      'time': '18:09 WIB',
      'icon': Icons.nightlight_round,
      'isCurrent': false,
    },
    {
      'name': 'Isya',
      'time': '19:21 WIB',
      'icon': Icons.mode_night,
      'isCurrent': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header section
            Stack(
              children: [
                Container(
                  height: 250, // Adjust height as needed
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/waktusholat.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Gradient overlay
                Container(
                  height: 250, // Match image container height
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black54, // Darken the image slightly
                      ],
                    ),
                  ),
                ),
                SafeArea(
                  // Add SafeArea to avoid status bar overlap
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      // Main column for header content
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment
                                  .spaceBetween, // Distribute space
                          // Row for back button and title
                          children: [
                            IconButton(
                              icon: const Icon(Icons.arrow_back),
                              iconSize: 24, //adjust icon size
                              color: Colors.white,
                              onPressed: () {
                                // Navigate back to the home page
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Home(),
                                  ),
                                );
                              },
                            ),
                            const Expanded(
                              // Flexible space for the title
                              child: Text(
                                'Waktu Sholat',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20), // Add spacing
                        Center(
                          // Center the time and next prayer info
                          child: Column(
                            children: [
                              const Text(
                                '08:34', // Replace with actual current time
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 48,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                'Isya dalam 1 jam 11 menit', // Replace with actual next prayer info
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // Date section
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Jumat, 1 Agustus 2025', // Replace with actual date
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '7 Shafar 1447H', // Replace with actual Islamic date
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
            // Prayer times list
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _prayerTimes.length,
              itemBuilder: (context, index) {
                final prayer = _prayerTimes[index];
                return PrayerTimeTileContent(
                  name: prayer['name'],
                  time: prayer['time'],
                  icon: prayer['icon'],
                  isCurrent: prayer['isCurrent'],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Custom widget for Prayer Time Tile
class PrayerTimeTileContent extends StatefulWidget {
  final String name;
  final String time;
  final IconData icon;
  final bool isCurrent;

  const PrayerTimeTileContent({
    Key? key,
    required this.name,
    required this.time,
    required this.icon,
    this.isCurrent = false,
  }) : super(key: key);

  @override
  _PrayerTimeTileContentState createState() => _PrayerTimeTileContentState();
}

class _PrayerTimeTileContentState extends State<PrayerTimeTileContent> {
  bool _isNotificationEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor:
                widget.isCurrent
                    ? Colors.blue.shade300
                    : const Color.fromARGB(255, 236, 247, 255),
            child: Icon(
              widget.icon,
              size: 24,
              color: widget.isCurrent ? Colors.white : Colors.blue.shade700,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight:
                        widget.isCurrent ? FontWeight.bold : FontWeight.normal,
                    color:
                        widget.isCurrent
                            ? Colors.blue.shade900
                            : Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.time,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color:
                        widget.isCurrent
                            ? Colors.blue.shade700
                            : Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _isNotificationEnabled = !_isNotificationEnabled;
              });
            },
            child: Icon(
              _isNotificationEnabled
                  ? Icons.notifications
                  : Icons.notifications_none,
              size: 24,
              color: _isNotificationEnabled ? Colors.blue : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
