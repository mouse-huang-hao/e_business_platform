
class BannerItem {
  String id;
  String imgUrl;
  BannerItem({required this.id,required this.imgUrl});
  factory BannerItem.fromJSON(Map<String,dynamic>json){
    return BannerItem(id: json["id"], imgUrl: json["imgUrl"]??"");
  }
}

class CategoryItem {
  String id;
  String name;
  String picture;
  List<CategoryItem>? children;
  CategoryItem({required this.id,required this.name,required this.picture,this.children});

  factory CategoryItem.fromJSON(Map<String,dynamic>json){
    return CategoryItem(
      id: json["id"]??"", 
      name: json["name"]??"",
      picture: json["picture"]??"",
      children: json["children"] == null
      ? null
      : (json["children"] as List).map((item)=>CategoryItem.fromJSON(item as Map<String,dynamic>)).toList());
      
  }
}


class RecommendationResult {
  String id;
  String title;
  List<SubType> subTypes;
  RecommendationResult({required this.id,required this.title,required this.subTypes});
  factory RecommendationResult.fromJSON(Map<String,dynamic>json){
    return RecommendationResult(
      id: json["id"]??"", 
      title: json["title"]??"",
      subTypes: (json["subTypes"] as List? ?? [])
      .map((item)=>SubType.fromJSON(item as Map<String,dynamic>)).toList());
      
  }
}

class SubType {
  String id;
  String title;
  GoodsItems goodsItems;
  SubType({required this.id,required this.title,required this.goodsItems});
  factory SubType.fromJSON(Map<String,dynamic>json){
    return SubType(
      id: json["id"]??"", 
      title: json["title"]??"",
      goodsItems:  GoodsItems.fromJSON(json["goodsItems"] as Map<String,dynamic>));
  }
}
class GoodsItems {
  int counts;
  int pageSize;
  int pages;
  int page;
  List<GoodsItem> items;
  GoodsItems({required this.counts,required this.pageSize,required this.pages,required this.page,required this.items});
  factory GoodsItems.fromJSON(Map<String,dynamic>json){
    return GoodsItems(
      counts: int.tryParse(json["counts"]?.toString()??"0")??0,
      pageSize: int.tryParse(json["pageSize"]?.toString()??"0")??0,
      pages: int.tryParse(json["pages"]?.toString()??"0")??0,
      page: int.tryParse(json["page"]?.toString()??"0")??0, 
      items: (json["items"] as List? ?? [])
      .map((item)=>GoodsItem.fromJSON(item as Map<String,dynamic>)).toList());
  }
}
class GoodsItem {
  String id;
  String name;
  String desc;
  String price;
  String picture;
  int orderNum;
  GoodsItem({required this.id,required this.name,required this.desc,required this.price,required this.picture,required this.orderNum});
  factory GoodsItem.fromJSON(Map<String,dynamic>json){
    return GoodsItem(
      id: json["id"]??"", 
      name: json["name"]??"",
      desc: json["desc"]??"",
      picture: json["picture"]??"",
      price: json["price"]??"0.0",
      orderNum: int.tryParse(json["orderNum"]?.toString()??"0")??0);
  }
}

class Good extends GoodsItem{
  int payCount = 0;
  Good({
    required super.id,
    required super.name,
    required super.price,
    required super.picture,
    required super.orderNum,
    required this.payCount,
  }):super(desc:"");

  factory Good.fromJSON(Map<String,dynamic>json){
    return Good(
      id: json["id"]?.toString()??"", 
      name: json["name"]?.toString()??"",
      price: json["price"]?.toString()??"",
      picture: json["picture"]?.toString()??"",
      orderNum: int.tryParse(json["orderNum"]?.toString() ?? "0")??0,
      payCount: int.tryParse(json["payCount"]?.toString()??"0")??0);
  }
 
}

class GoodItems {
  int counts;
  int pageSize;
  int pages;
  int page;
  List<Good> items;
  GoodItems({required this.counts,required this.pageSize,required this.pages,required this.page,required this.items});
  factory GoodItems.fromJSON(Map<String,dynamic>json){
    return GoodItems(
      counts: int.tryParse(json["counts"]?.toString()??"0")??0,
      pageSize: int.tryParse(json["pageSize"]?.toString()??"0")??0,
      pages: int.tryParse(json["pages"]?.toString()??"0")??0,
      page: int.tryParse(json["page"]?.toString()??"0")??0, 
      items: (json["items"] as List? ?? [])
      .map((item)=>Good.fromJSON(item as Map<String,dynamic>)).toList());
  }
}