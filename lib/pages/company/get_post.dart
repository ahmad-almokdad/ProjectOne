import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ProjectOne/domain/Post.dart';
import 'package:ProjectOne/pages/company/company_request.dart';
import 'package:ProjectOne/pages/company/update_post.dart';

class PostsPage extends StatefulWidget {
  @override
  _PostsPageState createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  List<Post> posts = [];

  CompanyRequest companyRequest = CompanyRequest();

  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Company Posts'),
      ),
      body: FutureBuilder(
        future: companyRequest.getPostsCompany(),
        builder: (BuildContext context, AsyncSnapshot<List<Post>> snapShot) {
          print('too');
          print(snapShot.hasData);
          if (snapShot.hasData) {
            posts = snapShot.data;
            print('data');
            return Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: CircleAvatar(
                    radius: 50,
                    child: Container(
                      width: 300,
                      height: 300,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('title  ' + posts[index].title),
                              Text('Job Type : ' + posts[index].jobType),
                              Text('Job Role Name : ' +
                                  posts[index].jobRole.name),
                              Text(
                                  'Start Salary : ' + posts[index].startSalary),
                              Text('Experience Years : ' +
                                  posts[index].experienceYears),
                              Text(
                                  'Description  : ' + posts[index].description),
                              SizedBox(
                                height: 16,
                              ),
                              RaisedButton(
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.green,
                                ),
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => UpdatePost(
                                        posts[index].id.toString(),
                                      ),
                                    ),
                                  );

                                },

                              ),
                              RaisedButton(
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onPressed: () {

                                  CompanyRequest().deletePost(posts[index].id.toString());
                                  setState(() {

                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: posts.length,
                  ),
                ),
              ],
            );
          }

          return CircularProgressIndicator();
        },

      ),
    );
  }
}
