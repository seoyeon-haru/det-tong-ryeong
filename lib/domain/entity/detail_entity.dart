// class DetailEntity {
//   String feedId;
//   String userNM;
//   DateTime feedTime;
//   String feedPhoto;

//   List<DetailComments> comments;

//   DetailEntity({
//     required this.feedId,
//     required this.userNM,
//     required this.feedTime,
//     required this.feedPhoto,
//     required this.comments,
//   });
// }
class DetailEntity {
  List<String> cLikeUsers;
  String comment;

  DetailEntity({
    required this.cLikeUsers,
    required this.comment,
  });
}
