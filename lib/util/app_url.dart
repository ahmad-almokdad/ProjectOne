class AppUrl {
  static const String localBaseURL = "http://10.0.2.2:8000/api";

  static const String baseURL = localBaseURL;
  static const String loginUser = baseURL + "/user/login";
  static const String getProfile = baseURL + "/user/userProfile";
  static const String loginCompany = baseURL + "/company/login";
  static const String ADD_EXPERIENCE_URL = baseURL+'/user/addExperience';
  static const String UPDATE_EXPERIENCE_URL = baseURL+'/user/updateExperience/';
  static const String UPDATE_EDUCATION_URL = baseURL+'/user/updateEducation/';
  static const String registerUser = baseURL + "/user/register";
  static const String registerCompany = baseURL + "/company/register";
  static const String forgotPassword = baseURL + "/forgot-password";
  static const String postsCompany = baseURL + "/company/post";
  static const String addPost = baseURL + "/company/post";
  static const String updatePost = baseURL + "/company/post/";
  static const String deletePost = baseURL + "/company/post/";
}
