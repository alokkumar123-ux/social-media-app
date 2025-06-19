import 'package:e_commerce/features/personalization/chatpage.dart';
import 'package:flutter/material.dart';


final List<String> person = [
    "Anvi",
    "Raj",
    "Sneha",
    "Jay",
    "Avantika",
    "Farhan",
    "Lavanya",
    "Saurabh",
    "Tanvi",
    "Reeva",
    "Arman",
    "Palak",
    "Prachi",
    "Kunal",
    "Bhavya",
    "Shaurya",
    "Nakul",
    "Rupal",
    "Vani",
    "Tushar",
    "Sanya",
    "Simran",
    "Yamini",
    "Harsh",
    "Tanya",
    "Ira",
    "Mitali",
    "Uday",
    "Ritika",
    "Vivek",
    "Krishna",
    "Amit",
    "Rohan",
    "Karan",
    "Gaurav",
    "Khushi",
    "Mihir",
    "Tanmay",
    "Akanksha",
    "Gauri",
    "Esha",
    "Zoya",
    "Tisha",
    "Ayush",
    "Yash",
  ];

  Color avatarColor(String name) {
    final colors = [
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.red,
      Colors.teal,
      Colors.indigo,
      Colors.brown,
    ];
    return colors[name.codeUnitAt(0) % colors.length];
  }

class Chatlog extends StatefulWidget {
  const Chatlog({super.key});

  @override
  State<Chatlog> createState() => _ChatlogState();
}

class _ChatlogState extends State<Chatlog> {
  int selectedIndex = 0;

  final List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.chat_bubble_rounded),
      label: "Chats",
    ),
    BottomNavigationBarItem(icon: Icon(Icons.group), label: "Groups"),
  ];

  final List<String> lastMessages = [
    "Hey! How are you?",
    "Let's catch up soon!",
    "See you at 5pm.",
    "Got it!",
    "Thank you!",
    "On my way.",
    "Can you send the file?",
    "Happy Birthday!",
    "Congrats!",
    "Call me when free.",
    "Good night!",
    "Good morning!",
    "Miss you!",
    "All the best!",
    "Let's meet tomorrow.",
    "Check your email.",
    "See you soon!",
    "Take care!",
    "What's up?",
    "No worries!",
    "Awesome!",
    "Sure!",
    "Will do.",
    "Okay!",
    "Noted.",
    "Thanks!",
    "See you!",
    "Alright!",
    "Done!",
    "Cool!",
    "Great!",
    "Perfect!",
    "Sounds good!",
    "Agreed!",
    "Yes!",
    "No problem!",
    "Welcome!",
    "See you then!",
    "Message me!",
    "Ping me!",
    "Let's go!",
    "Ready!",
    "Waiting!",
    "Almost there!",
  ];

  final List<String> times = [
    "09:30",
    "10:15",
    "11:00",
    "11:45",
    "12:30",
    "13:15",
    "14:00",
    "14:45",
    "15:30",
    "16:15",
    "17:00",
    "17:45",
    "18:30",
    "19:15",
    "20:00",
    "20:45",
    "21:30",
    "22:15",
    "23:00",
    "23:45",
    "08:30",
    "07:15",
    "06:00",
    "05:45",
    "04:30",
    "03:15",
    "02:00",
    "01:45",
    "00:30",
    "00:15",
    "12:00",
    "13:45",
    "15:00",
    "16:45",
    "18:00",
    "19:45",
    "21:00",
    "22:45",
    "23:30",
    "00:15",
    "01:00",
    "02:45",
    "03:30",
    "04:15",
    "05:00",
  ];

  

  Widget _buildChatList() {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemCount: person.length,
      separatorBuilder: (context, index) => SizedBox(height: 4),
      itemBuilder: (context, index) {
        return AnimatedContainer(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          margin: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
          child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: avatarColor(person[index]),
                child: Text(
                  person[index][0],
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                radius: 26,
              ),
              title: Text(
                person[index],
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              subtitle: Text(
                lastMessages[index % lastMessages.length],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).textTheme.bodySmall?.color,
                ),
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    times[index % times.length],
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  SizedBox(height: 4),
                  if (index % 3 == 0)
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        "${(index + 1) % 10}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Chatpage(index: index,)));
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildGroupsList() {
    // Placeholder for groups tab
    return Center(
      child: Text(
        "Groups feature coming soon!",
        style: TextStyle(fontSize: 18, color: Colors.grey),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final pages = [_buildChatList(), _buildGroupsList()];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "WeChat",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Implement search
            },
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.secondary,
              child: Icon(Icons.person, color: Colors.white),
            ),
          ),
        ],
        elevation: 2,
      ),
      body: Column(
          children: [
            SizedBox(height: 10),
            Expanded(child: pages[selectedIndex]),
          ],
        ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        items: bottomItems,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.grey,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 8,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
