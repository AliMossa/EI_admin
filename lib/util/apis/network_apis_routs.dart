class NetworkApisRouts {
  final String _server = 'http://127.0.0.1:8000/';

  final String _loginApi = 'api/login';
  final String _logoutApi = 'api/logout';
  final String _sendVerificationCode = 'api/send_verification_code';
  final String _verifyVerificationCode = 'api/verify_code';
  final String _resetForgottenPassword = 'api/reset_password';
  final String _getProfileInfo = 'api/profile';
  final String _updateProfileInfo = 'api/update';
  final String _search = 'api/search_user_by_role_and_name';
  final String _getUserLogs = 'api/getLogsForUser/';
  final String _getEmployees = 'api/get_employee_by_role_and_active';
  final String _viewEmployee = 'api/get_info_users_by_id/';
  final String _getAdminCommonQuestions = 'api/get_FrequentlyQuestions';
  final String _getUserCommonQuestions = 'api/get_all_help_for_admin';
  final String _addCommonQuestion = 'api/create_FrequentlyQuestions';
  final String _removeCommonQuestion = 'api/delete_FrequentlyQuestions/';
  final String _answerUserQuestion = 'api/create_Answer_by_admin/';
  final String _removeUserQuestion = 'api/delete_question/';
  final String _signUp = 'api/signup';
  final String _addAdditonalEmployeeInformation = 'api/add_info_employee/';
  final String _activeUser = 'api/activate/';
  final String _unActiveUser = 'api/deactivate/';
  final String _addUser = 'api/signup';
  final String _updateEmployee = 'api/updateEmployeeInformation/';
  final String _getAllRequests = 'api/get_all_requests';
  final String _getRequestInfo = 'api/get_requests_by_id/';
  final String _getAllRewards = 'api/get_Rewards';
  final String _addNewReward = 'api/add_reward_by_admin';
  final String _updateReward = 'api/update_reward_by_admin/';
  final String _removeReward = 'api/delete_reward_by_admin/';
  final String _acceptPropertyRequest = 'api/accept_request_from_expert/';
  final String _rejectPropertyRequest = 'api/reject_request_from_expert/';
  final String _getOwnedProperties = 'api/owned_properties';
  final String _getSoldProperties = 'api/sold_properties';
  final String _getPropertyInfo = 'api/get_properties_by_id/';
  final String _getPropertyImages = 'api/get_image_for_property_by_id/';
  final String _setPropertySold = 'api/markAsSold/';
  final String _propertyNewStudy = 'api/createRequest/';
  final String _getSuccessStatistics =
      'api/successful_Requests_Percentage_ByMonth_in_year';
  final String _getStatisticsOfUsers = 'api/user_counts_by_role';
  final String _getRequestsStatistics = 'api/get_Request_Statistics';
  final String _getEconomicEvaluation = 'api/economic_evaluation/';
  final String _getMoneiesRates = 'https://open.er-api.com/v6/latest/USD';

  String getBaseUrl() => _server;
  String getLoginApi() => _server + _loginApi;
  String getLogoutApi() => _server + _logoutApi;
  String getsendVerificationCodeApi() => _server + _sendVerificationCode;
  String getverifyVerificationCodeApi() => _server + _verifyVerificationCode;
  String getresetForgottenPasswordApi() => _server + _resetForgottenPassword;
  String getProfileInfoApi() => _server + _getProfileInfo;
  String updateProfileInfoApi() => _server + _updateProfileInfo;
  String searchApi() => _server + _search;
  String getUserLogsApi() => _server + _getUserLogs;
  String getEmployeesApi() => _server + _getEmployees;
  String viewEmployeeApi() => _server + _viewEmployee;
  String getAdminCommonQuestionsApi() => _server + _getAdminCommonQuestions;
  String getUserCommonQuestionsApi() => _server + _getUserCommonQuestions;
  String addCommonQuestionApi() => _server + _addCommonQuestion;
  String removeCommonQuestionApi() => _server + _removeCommonQuestion;
  String answerUserQuestionApi() => _server + _answerUserQuestion;
  String removeUserQuestionApi() => _server + _removeUserQuestion;
  String addBasicEmployeeInfoApi() => _server + _signUp;
  String addAdditionalEmployeeInfoApi() =>
      _server + _addAdditonalEmployeeInformation;
  String activeUserApi() => _server + _activeUser;
  String unActiveUserApi() => _server + _unActiveUser;
  String addUserApi() => _server + _addUser;
  String updateEmployeeApi() => _server + _updateEmployee;
  String getAllRequestsApi() => _server + _getAllRequests;
  String getRequestInfoApi() => _server + _getRequestInfo;
  String getAllRewardsApi() => _server + _getAllRewards;
  String addNewRewardApi() => _server + _addNewReward;
  String updateRewardApi() => _server + _updateReward;
  String removeRewardApi() => _server + _removeReward;
  String acceptPropertyRequestApi() => _server + _acceptPropertyRequest;
  String rejextPropertyRequestApi() => _server + _rejectPropertyRequest;
  String getOwnedPropertiesApi() => _server + _getOwnedProperties;
  String getSoldPropertiesApi() => _server + _getSoldProperties;
  String getPropertyInfoApi() => _server + _getPropertyInfo;
  String getPropertyImagesApi() => _server + _getPropertyImages;
  String setPropertySoldApi() => _server + _setPropertySold;
  String propertyNewStudyApi() => _server + _propertyNewStudy;
  String getSuccessStatisticsApi() => _server + _getSuccessStatistics;
  String getStatisticsOfUsersApi() => _server + _getStatisticsOfUsers;
  String getRequestsStatisticsApi() => _server + _getRequestsStatistics;
  String getEconomicEvaluationApi() => _server + _getEconomicEvaluation;
  String getMoniesRatesApi() => _getMoneiesRates;
}
