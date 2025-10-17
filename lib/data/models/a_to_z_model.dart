import '../../domain/entities/a_to_z_entity.dart';
import 'package:html/dom.dart';

class AToZModel{
  final List<AToZGroupModel> groups;

  AToZModel({
    required this.groups
  });

  static AToZModel fromEntity(AToZEntity entity){
    return AToZModel(
      groups: entity.groups.map((e) => AToZGroupModel.fromEntity(e)).toList(),
    );
  }

  AToZEntity toEntity(){
    return AToZEntity(
      groups: groups.map((e) => e.toEntity()).toList()
    );
  }

  static AToZModel fromHtml(Document document){
    return AToZModel(
      groups: document.getElementsByClassName("mntl-alphabetical-list__group").map((e) => AToZGroupModel.fromHtml(e)).toList()
    );
  }
}

class AToZGroupModel{
  final String title;
  final List<AToZItemsModel> entities;

  AToZGroupModel({
    required this.title,
    required this.entities
  });

  static AToZGroupModel fromEntity(AToZGroupEntity entity){
    return AToZGroupModel(
      title: entity.title,
      entities: entity.entities.map((e) => AToZItemsModel.fromEntity(e)).toList()
    );
  }

  AToZGroupEntity toEntity(){
    return AToZGroupEntity(
      title: title,
      entities: entities.map((e) => e.toEntity()).toList()
    );
  }

  static AToZGroupModel fromHtml(Element element){
    return AToZGroupModel(
      title: element.querySelector("h3.mntl-alphabetical-list__heading.text-title-200-moderate")?.text.trim() ?? "",
      entities: element.getElementsByClassName("comp mntl-link-list__item").map((e) => AToZItemsModel.fromHtml(e)).toList()
    );
  }
}

class AToZItemsModel{
  final String link;
  final String item;

  AToZItemsModel({
    required this.link,
    required this.item
  });

  static AToZItemsModel fromEntity(AToZItemsEntity aToZItemsEntity){
    return AToZItemsModel(
      link: aToZItemsEntity.link,
      item: aToZItemsEntity.item
    );
  }

  AToZItemsEntity toEntity(){
    return AToZItemsEntity(
      link: link,
      item: item
    );
  }

  static AToZItemsModel fromHtml(Element element){
    return AToZItemsModel(
      link: element.querySelector("a")?.attributes["href"] ?? "",
      item: element.querySelector("a")?.text.trim() ?? "",
    );
  }
}