String local_mail = "";
String local_name = "oussema";
String local_imageUrl = 'https://scontent.ftun15-1.fna.fbcdn.net/v/t1.6435-9/205531233_842409963363261_3976714586892205886_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=174925&_nc_ohc=30ML2HdITLAAX8KaV_w&_nc_ht=scontent.ftun15-1.fna&oh=00_AT9o0S-X0BjbIwXmBovheNzusgAGXsyqoriyoeN1JF3zIQ&oe=62D0F21D';

class User1 {
  final String name;
  final String imageUrl;
  final String bio;

  const User1( {
    required this.name,
    required this.imageUrl,
    required this.bio,
  });
}

 User1 currentUser = User1(
  name: 'Marcus Ng',
  imageUrl:
  'https://images.unsplash.com/photo-1578133671540-edad0b3d689e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1351&q=80',
  bio: 'I love baseball',
);
