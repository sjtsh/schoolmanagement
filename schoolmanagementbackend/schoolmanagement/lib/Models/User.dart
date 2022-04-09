//
// class User(models.Model):
// name = models.TextField()
// password = models.TextField()
// year = models.IntegerField()
// position = models.IntegerField()
// attendance = models.IntegerField()
// contact = models.TextField()
// img = models.TextField()
// created = models.DateTimeField(auto_now_add=True)
//
// def __str__(self):
// return self.name
//
class User {
  final int id;
  final String name;
  final int year;
  final int position;
  final int attendance;
  final String contact;
  final String img;
  final DateTime created;
  final String password;

  User(this.id, this.name, this.year, this.position, this.attendance,
      this.contact, this.img, this.created, this.password);
}
