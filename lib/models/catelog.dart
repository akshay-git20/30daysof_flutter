class Item {
  final String id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item({required this.id,required this.name, required this.desc,required this.price,required this.color,required this.image});
}

final prodects = [
  Item(
    id: "excoo90",
    name: "apple iphone 14 pro ",
    desc: "apple",
    price: 1000000,
    color: "#33505a",
    image: "https://www.bing.com/images/search?view=detailV2&ccid=8UitnSX6&id=C53EB071C2690EDF00064F4FBB67E73D3B69A2AA&thid=OIP.8UitnSX6G7DINicqVH34ZwHaJP&mediaurl=https%3a%2f%2ftechyvoice.com%2fwp-content%2fuploads%2f2021%2f05%2fiPhone-14.jpg&exph=807&expw=647&q=iphone+14&simid=607996928148989737&FORM=IRPRST&ck=CA9F20BA324627C79C110EFD2F53B188&selectedIndex=133"
  )
];
