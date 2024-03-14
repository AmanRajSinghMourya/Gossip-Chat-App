import 'package:flutter/material.dart';
import 'package:gossip/Config/colors.dart';

class UpdateUserProfile extends StatelessWidget {
  const UpdateUserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkBackgroundColor,
        title: Text("Update User Profile"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: darkPrimaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: darkBackgroundColor,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            height: 150,
                            width: 150,
                            child: Icon(
                              Icons.image,
                              size: 45,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Personel Info",
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextField(
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                                hintText: "Name",
                                prefixIcon: Icon(Icons.person)),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextField(
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              hintText: "user@gmial.com",
                              prefixIcon: Icon(
                                Icons.email,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextField(
                            decoration: InputDecoration(
                              hintText: "Phone",
                              prefixIcon: Icon(Icons.phone),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 25, vertical: 15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: darkBackgroundColor,
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.save,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("Save"),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
