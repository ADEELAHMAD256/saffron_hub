// import 'package:ceo_event_menagment/const/constent.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static SharedPreferences? _preferences;
  static const _KeyAccessToken = 'authToken';
  // static const _KeyAccessToken1 = 'authToken1';
  static const _KeyUserId = 'mMyUserId';
  // static const _keyApplicationId = 'AppID';
  //
  // static const _KeyUserFirstName = 'userFirstName';
  // static const _KeyUserLastName = 'userLastName';
  // static const _KeyUserNumber = 'userNumber';
  // static const _KeyUserProfile = 'userProfile';
  // static const _KeyUserEmail = 'userEmail';
  // static const _KeyUserQualification = 'userQualification';
  // static const _KeyUserVaccinationCertificate = 'userVaccinationCertificate';
  // static const _KeyUserVisa = 'userVisa';
  // static const _KeyUserVaccinationStatus = 'userVaccinationStatus';
  // static const _KeyUserGender = 'userGender';
  // static const _KeyUserActiveStatus = 'userGender';
  // static const _usid = 'user_id';
  static const _KeyUsId1 = 'user_id1';
  // static const _eventid = 'Event_id';
  // static const _axCounter = 'ax_count';
  // static const _axCounter1 = 'ax_count1';
  // static const _axCounter2 = 'ax_count2';
  // static const _eventJobId = 'event_jobid';
  // static const _notes = 'notes';
  // static const _KeyPrivateJobId = 'private_Job_id';
  // static const _KeyJobType = 'job_type';
  // static const _KeyGenderType = 'gender_type';
  // static const _KeyMn = 'phone';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  //
  //
  // static saveInPreference(String preName, String value) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setString(preName, value);
  //   print('Bismillah: In save preference function');
  // }

  // static Future<String> getFromPreference(String preName) async {
  //   String returnValue = "";
  //
  //   final prefs = await SharedPreferences.getInstance();
  //   returnValue = prefs.getString(preName) ?? "";
  //   return returnValue;
  // }

  static Future setAccessToken(String s) async {
    await _preferences?.setString(_KeyAccessToken, s);
  }

  // static Future setPhoneToken(String s) async {
  //   await _preferences?.setString(_KeyMn, s);
  // }
  //
  // static Future setAccessToken1(String s) async {
  //   await _preferences?.setString(_KeyAccessToken1, s);
  // }
  //
  // static Future setEventId(String s) async {
  //   await _preferences?.setString(_eventid, s);
  // }
  //
  // static Future setNotes(String s) async {
  //   await _preferences?.setString(_notes, s);
  // }
  //
  // static Future setEventJobId(String s) async {
  //   await _preferences?.setString(_eventJobId, s);
  // }
  //
  // static Future setUserFirstName(String s) async {
  //   await _preferences?.setString(_KeyUserFirstName, s);
  // }
  //
  // static Future setUserLastName(String s) async {
  //   await _preferences?.setString(_KeyUserLastName, s);
  // }
  //
  // static Future setUserEmail(String s) async {
  //   await _preferences?.setString(_KeyUserEmail, s);
  // }
  //
  // static Future setUserQualification(String s) async {
  //   await _preferences?.setString(_KeyUserQualification, s);
  // }
  //
  // static Future setUserVaccinationCertificate(String s) async {
  //   await _preferences?.setString(_KeyUserVaccinationCertificate, s);
  // }
  //
  // static Future setUserVaccinationStatus(String s) async {
  //   await _preferences?.setString(_KeyUserVaccinationStatus, s);
  // }
  //
  // static Future setUserVisa(String s) async {
  //   await _preferences?.setString(_KeyUserVisa, s);
  // }
  //
  // static Future setUserActiveStatus(String s) async {
  //   await _preferences?.setString(_KeyUserActiveStatus, s);
  // }
  //
  // static Future setUserGender(String s) async {
  //   await _preferences?.setString(_KeyUserGender, s);
  // }
  //
  // static Future setUserProfile(String s) async {
  //   await _preferences?.setString(_KeyUserProfile, s);
  // }
  //
  // static Future setUserNumber(String s) async {
  //   await _preferences?.setString(_KeyUserNumber, s);
  // }
  //
  // static Future setPrivateJobId(String s) async {
  //   await _preferences?.setString(_KeyPrivateJobId, s);
  // }
  //
  static Future setUserId(String s) async {
    await _preferences?.setString(_KeyUserId, s);
    // }
    //
    // static Future setUserId1(String s) async {
    //   await _preferences?.setString(_KeyUsId1, s);
    // }
    //
    // static Future setAExCount(String s) async {
    //   await _preferences?.setString(_axCounter, s);
    // }
    //
    // static Future setAExCount1(String s) async {
    //   await _preferences?.setString(_axCounter1, s);
    // }
    //
    // static Future setAExCount2(String s) async {
    //   await _preferences?.setString(_axCounter2, s);
    // }
    //
    // static Future setApplicationId(String s) async {
    //   await _preferences?.setString(_keyApplicationId, s);
    // }
    //
    // static Future setJobType1(String s) async {
    //   await _preferences?.setString(_KeyJobType, s);
    // }
    //
    // static Future setGenderType(String s) async {
    //   await _preferences?.setString(_KeyGenderType, s);
    // }

    String? getAccessToken() => _preferences?.getString(_KeyAccessToken);

    // static String? getAccessToken1() => _preferences?.getString(_KeyAccessToken1);
    //
    // static String? getUserFirstName() =>
    //     _preferences?.getString(_KeyUserFirstName);
    //
    // static String? getUserNumber() => _preferences?.getString(_KeyUserNumber);
    //
    // static String? getUserLastName() => _preferences?.getString(_KeyUserLastName);
    //
    // static String? getUserVaccinationCertificate() =>
    //     _preferences?.getString(_KeyUserVaccinationCertificate);
    //
    // static String? getUserVaccinationStatus() =>
    //     _preferences?.getString(_KeyUserVaccinationStatus);
    //
    // static String? getUserGender() => _preferences?.getString(_KeyUserGender);
    //
    // static String? getUserQualification() =>
    //     _preferences?.getString(_KeyUserQualification);
    //
    // static String? getUserEmail() => _preferences?.getString(_KeyUserEmail);
    //
    // static String? getUserVisa() => _preferences?.getString(_KeyUserVisa);
    //
    // static String? getUserActive() =>
    //     _preferences?.getString(_KeyUserActiveStatus);
    //
    // static String? getUserProfile() => _preferences?.getString(_KeyUserProfile);
    //
    // static String? getUserId() => _preferences?.getString(_KeyUserId);
    //
    // static String? getExCount() => _preferences?.getString(_axCounter);
    //
    // static String? getExCount1() => _preferences?.getString(_axCounter1);
    //
    // static String? getExCount2() => _preferences?.getString(_axCounter2);
    //
    // static String? getEventJobId() => _preferences?.getString(_eventJobId);
    //
    // static String? getEventId() => _preferences?.getString(_eventid);
    //
    // static String? getNotes() => _preferences?.getString(_notes);
    //
    // static String? getApplicationId() =>
    //     _preferences?.getString(_keyApplicationId);
    //
    // static String? getPrivateJobId() => _preferences?.getString(_KeyPrivateJobId);
    //
    // static String? getJobType() => _preferences?.getString(_KeyJobType);
    // static String? getGenderType() => _preferences?.getString(_KeyGenderType);
    //
    // static String? getPUserId() => _preferences?.getString(_KeyUsId1);
    // static String? getPhone() => _preferences?.getString(_KeyMn);
  }
}
