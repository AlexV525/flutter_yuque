///
/// [Author] Alex (https://github.com/AlexVincent525)
/// [Date] 2020/3/16 17:28
///
part of 'models.e.dart';

class UserInfo {
  int id;
  String type;
  int spaceId;
  int accountId;
  String login;
  String name;
  String avatarUrl;
  int booksCount;
  int publicBooksCount;
  int followersCount;
  int followingCount;
  int public;
  String description;
  String createdAt;
  String updatedAt;
  String sSerializer;

  UserInfo({
    this.id,
    this.type,
    this.spaceId,
    this.accountId,
    this.login,
    this.name,
    this.avatarUrl,
    this.booksCount,
    this.publicBooksCount,
    this.followersCount,
    this.followingCount,
    this.public,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.sSerializer,
  });

  UserInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    spaceId = json['space_id'];
    accountId = json['account_id'];
    login = json['login'];
    name = json['name'];
    avatarUrl = json['avatar_url'];
    booksCount = json['books_count'];
    publicBooksCount = json['public_books_count'];
    followersCount = json['followers_count'];
    followingCount = json['following_count'];
    public = json['public'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    sSerializer = json['_serializer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['type'] = this.type;
    data['space_id'] = this.spaceId;
    data['account_id'] = this.accountId;
    data['login'] = this.login;
    data['name'] = this.name;
    data['avatar_url'] = this.avatarUrl;
    data['books_count'] = this.booksCount;
    data['public_books_count'] = this.publicBooksCount;
    data['followers_count'] = this.followersCount;
    data['following_count'] = this.followingCount;
    data['public'] = this.public;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['_serializer'] = this.sSerializer;
    return data;
  }

  @override
  String toString() {
    return 'UserInfo ${JsonEncoder.withIndent(' ').convert({
      'id': id,
      'type': type,
      'spaceId': spaceId,
      'accountId': accountId,
      'login': login,
      'name': name,
      'avatarUrl': avatarUrl,
      'booksCount': booksCount,
      'publicBooksCount': publicBooksCount,
      'followersCount': followersCount,
      'followingCount': followingCount,
      'public': public,
      'description': description,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'sSerializer': sSerializer,
    })}';
  }
}
