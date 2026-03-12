// home screen code
import 'package:flutter/material.dart';
import 'package:astrophotography_blog/services/auth_service.dart';
import 'package:astrophotography_blog/screens/new_post.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const Color honeyBronze = Color(0xFFFCB454);
  static const Color thistle = Color(0xFFCBC3D5);
  static const Color vintageLavender = Color(0xFF73628A);
  static const Color spaceIndigo = Color(0xFF302C5C);
  static const Color prussianBlue = Color(0xFF141C34);

  Widget _buildChallengeCard(
    BuildContext context,
    IconData icon,
    String name,
    String description,
  ) {
    return GestureDetector(
      onTap: () => _showChallengeDialog(context, icon, name, description),
      child: Container(
        width: 140,
        margin: const EdgeInsets.symmetric(horizontal: 6.0),
        decoration: BoxDecoration(
          color: vintageLavender.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white, width: 0.5),
        ),
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 36, color: honeyBronze),
            const SizedBox(height: 8),
            Text(
              name,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              description,
              style: TextStyle(
                fontSize: 11,
                color: thistle,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  void _showChallengeDialog(
    BuildContext context,
    IconData icon,
    String name,
    String description,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: spaceIndigo,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Column(
          children: [
            Icon(icon, size: 48, color: honeyBronze),
            const SizedBox(height: 8),
            Text(
              name,
              style: const TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        content: Text(
          description,
          style: TextStyle(color: thistle),
          textAlign: TextAlign.center,
        ),
        actions: [
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: honeyBronze,
                foregroundColor: prussianBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () => Navigator.pop(context),
              child: const Text('Complete Now'),
            ),
          ),
        ],
      ),
    );
  }

  final List<Map<String, String>> posts = const [
    {
      'username': 'astro_jane',
      'caption': 'Orion Nebula on a clear winter night',
      'imageUrl': 'https://picsum.photos/seed/orion/800/600',
      'iso': '3200',
      'aperture': 'f/2.8',
      'exposure': '30s',
      'camera': 'Canon EOS Ra',
    },
    {
      'username': 'stargazer_mike',
      'caption': 'Milky Way rising over the desert',
      'imageUrl': 'https://picsum.photos/seed/milkyway/800/600',
      'iso': '6400',
      'aperture': 'f/1.8',
      'exposure': '20s',
      'camera': 'Sony A7III',
    },
  ];

  Widget _buildPostCard(Map<String, String> post) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: spaceIndigo,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 18,
                  backgroundColor: vintageLavender,
                  child: Text(
                    post['username']![0].toUpperCase(),
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  '@${post['username']}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          ClipRRect(
            child: Image.network(
              post['imageUrl']!,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.favorite_border, color: Colors.white),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.ios_share, color: Colors.white),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Text(
              post['caption']!,
              style: TextStyle(color: thistle, fontSize: 14),
            ),
          ),
          Theme(
            data: ThemeData(dividerColor: Colors.transparent),
            child: ExpansionTile(
              tilePadding: const EdgeInsets.symmetric(horizontal: 12),
              minTileHeight: 36,
              title: Text(
                'Camera Settings',
                style: TextStyle(color: honeyBronze, fontSize: 13),
              ),
              iconColor: honeyBronze,
              collapsedIconColor: honeyBronze,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Camera: ${post['camera']}', style: TextStyle(color: thistle, fontSize: 12)),
                        Text('ISO: ${post['iso']}', style: TextStyle(color: thistle, fontSize: 12)),
                        Text('Aperture: ${post['aperture']}', style: TextStyle(color: thistle, fontSize: 12)),
                        Text('Exposure: ${post['exposure']}', style: TextStyle(color: thistle, fontSize: 12)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPostFeed() {
    if (posts.isEmpty) {
      return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 32),
            Icon(
              Icons.nightlight_round,
              size: 48,
              color: honeyBronze,
            ),
            const SizedBox(height: 16),
            Text(
              'no new posts,\ncurrently mesmerized by the moon',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: thistle,
              ),
            ),
          ],
      );
    }

    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return _buildPostCard(posts[index]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: prussianBlue,
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 1.0,
              child: Image.asset(
                'assets/starry_sky_bg_1.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: honeyBronze,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.add, color: prussianBlue),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const NewPostPage(),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      'welcome back\nto the stars',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.cedarvilleCursive(
                        fontSize: 28,
                        color: honeyBronze,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 14),
                          padding: const EdgeInsets.only(top: 16, bottom: 12),
                          decoration: BoxDecoration(
                            border: Border.all(color: vintageLavender, width: 1.5),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: SizedBox(
                            height: 150,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              children: [
                                _buildChallengeCard(
                                  context,
                                  Icons.star,
                                  'First Light',
                                  'Capture your first photo of the night sky',
                                ),
                                _buildChallengeCard(
                                  context,
                                  Icons.camera_alt,
                                  'Long Exposure',
                                  'Take a 30+ second exposure of the Milky Way',
                                ),
                                _buildChallengeCard(
                                  context,
                                  Icons.nightlight_round,
                                  'Lunar Detail',
                                  'Photograph craters on the Moon\'s surface',
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left: 16,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            color: prussianBlue,
                            child: Text(
                              'Daily Challenges',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: thistle,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  if (posts.isEmpty)
                    Column(
                      children: [
                        const SizedBox(height: 32),
                        Icon(Icons.nightlight_round, size: 48, color: honeyBronze),
                        const SizedBox(height: 16),
                        Text(
                          'no new posts,\ncurrently mesmerized by the moon',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16, color: thistle),
                        ),
                      ],
                    )
                  else
                    ...posts.map((post) => _buildPostCard(post)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
