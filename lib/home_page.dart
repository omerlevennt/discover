import 'package:discover/util/job_card.dart';
import 'package:discover/util/recent_job_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List jobForYou = [
    ["Uber", "UI Designer", "lib/icons/uber.png", 45],
    ["Google", "Product Dev", "lib/icons/google.png", 88],
    ["Apple", "Sowfware Eng.", "lib/icons/apple.png", 95],
  ];
  final List recentHobs = [
    ["Nike", "Web Designer", "lib/icons/nike.png", 20],
    ["Apple", "Sowfware Eng.", "lib/icons/apple.png", 95],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 75),
          // app bar
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.white)),
              height: 50,
              child: Image.asset(
                "lib/icons/list.png",
                color: Colors.grey[800],
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),

          // discover a new path
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text(
              "Discover a new path",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
            ),
          ),
          SizedBox(
            height: 25,
          ),

          // search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey[200]),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Container(
                              height: 30,
                              child: Image.asset(
                                "lib/icons/search.png",
                                color: Colors.grey[600],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Search for a job.."),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: 50,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(12)),
                  child: Image.asset(
                    "lib/icons/settings.png",
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          //for you => job cards
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text(
              "For You ",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
            ),
          ),
          SizedBox(
            height: 25,
          ),

          Container(
            height: 160,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: jobForYou.length,
                itemBuilder: (context, index) {
                  return JobCard(
                    companyName: jobForYou[index][0],
                    jobTitle: jobForYou[index][1],
                    logoImagePath: jobForYou[index][2],
                    hourlyRate: jobForYou[index][3],
                  );
                }),
          ),

          SizedBox(
            height: 25,
          ),

          // recently add => job tiles
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text(
              "Recently Added",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
            ),
          ),

          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: ListView.builder(
                itemCount: recentHobs.length,
                itemBuilder: (context, index) {
                  return RecentJobCard(
                    companyName: recentHobs[index][0],
                    jobTitle: recentHobs[index][1],
                    logoImagePath: recentHobs[index][2],
                    hourlyRate: recentHobs[index][3],
                  );
                }),
          ))
        ],
      ),
    );
  }
}
