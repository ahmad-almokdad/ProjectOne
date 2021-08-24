import 'dart:convert';

import 'package:http/http.dart';
import 'package:ProjectOne/domain/Post.dart';
import 'package:ProjectOne/util/app_url.dart';
import 'package:ProjectOne/util/shared_preference.dart';

class CompanyRequest{
  
  Future<List<Post>> getPostsCompany()async{

    List<Post>posts = [];

    String token = await UserPreferences().getToken();
    Map<String,String>headers = {
      'Accept' : 'application/json',
      'Authorization': 'Bearer $token',
    };
    
    var response = await get(AppUrl.postsCompany,headers: headers);

    print('statuscode');
    print(response.statusCode);
    if(response.statusCode == 200){
      var body = jsonDecode(response.body);
      var data = body['data'];
    for(var post in data){
      print(post);
      posts.add(Post.fromJson(post));
    }
    print(posts.length);
    return posts;

    }
    print('posts');
    print(posts);
return null;
    
  }

  Future<bool> updatePost(String title,String jobRoleId,String jobType,String startSalary,String experienceYears,String description,String tags,String idPost)async{

    String token = await UserPreferences().getToken();
    Map<String,String>headers = {
      'Accept' : 'application/json',
      'Authorization': 'Bearer $token',
    };

    Map<String,dynamic>body = {
      'job_role_id':jobRoleId,
      'title':title,
      'job_type':jobType,
      'start_salary':startSalary,
      'experience_years':experienceYears,
      'description':description,
      'tags[0]':'node.js',
    };

    print('hereis');
    print(body);
    print(AppUrl.updatePost+idPost);
    var response = await put(AppUrl.updatePost+idPost,headers: headers,body: body);

    print('this is statuscode');
    print(response.statusCode);
    if(response.statusCode == 200){
      return true;
    }


return false;
  }






  Future<bool> addPost(String title,String jobRoleId,String jobType,String startSalary,String experienceYears,String description,String tags)async{

    String token = await UserPreferences().getToken();
    Map<String,String>headers = {
      'Accept' : 'application/json',
      'Authorization': 'Bearer $token',
    };

    Map<String,dynamic>body = {
      'job_role_id':jobRoleId,
      'title':title,
      'job_type':jobType,
      'start_salary':startSalary,
      'experience_years':experienceYears,
      'description':description,
      'tags[0]':'node.js',
    };

    print('hereis');
    print(body);
    print(AppUrl.addPost);
    var response = await post(AppUrl.addPost,headers: headers,body: body);

    print('this is statuscode');
    print(response.statusCode);
    if(response.statusCode == 200){
      return true;
    }


    return false;
  }




  Future<bool> deletePost(String idPost)async{

    String token = await UserPreferences().getToken();
    Map<String,String>headers = {
      'Accept' : 'application/json',
      'Authorization': 'Bearer $token',
    };


    print(AppUrl.deletePost+idPost);
    var response = await delete(AppUrl.deletePost+idPost,headers: headers);

    print('this is statuscode');
    print(response.statusCode);
    if(response.statusCode == 200){
      return true;
    }


    return false;
  }

  
  
}//end class