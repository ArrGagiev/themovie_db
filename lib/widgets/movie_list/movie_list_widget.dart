import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:themovie_db/resources/resources.dart';

class Movie {
  final String imageName;
  final String title;
  final String time;
  final String description;

  Movie(
      {required this.imageName,
      required this.title,
      required this.time,
      required this.description});
}

class MovieListWidget extends StatefulWidget {
  MovieListWidget({Key? key}) : super(key: key);

  @override
  State<MovieListWidget> createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  final _movies = [
    Movie(
      imageName: AppImages.tower,
      title: 'Вышка',
      time: '3 января 1990',
      description:
          'Бекки всегда была экстремалом, но после гибели мужа решила прекратить погоню за адреналином.',
    ),
    Movie(
      imageName: AppImages.tower,
      title: 'Мстители',
      time: '12 сент 2007',
      description:
          'Много героев, всяки экшн и смешные моменты, интересная история но до определенного момента.',
    ),
    Movie(
      imageName: AppImages.tower,
      title: 'Клоп',
      time: '24 матра',
      description:
          'Таракан по имени Чарльз, ищет для себя уютный шкаф, но на пути ему попадаются не оченьто дружелюбные владельцы мебели.',
    ),
    Movie(
      imageName: AppImages.tower,
      title: 'Головастик',
      time: '11 ноября 2012',
      description:
          'Будущая лягушка Лукас остался один во всем болоте, все было хорошо до тех пор пока у него не отросла лапа.',
    ),
    Movie(
      imageName: AppImages.tower,
      title: 'Чебурек вместо каски',
      time: '77 февраля 1856',
      description:
          'Лейтенант дивизиона паприки находит загадчный шлем, после которого его все хотят съесть',
    ),
    Movie(
      imageName: AppImages.tower,
      title: 'Карман с золотом',
      time: '5 декабря 1999',
      description:
          'Рука проживающая в рукаве пиджака находит укромное место и находит несметное богатство, как она распорядится тем что ей послала сама судьба',
    ),
    Movie(
      imageName: AppImages.tower,
      title: 'Наклейка на подбородке',
      time: '45 зебрюбря 3003',
      description:
          'После жесткой пьянки главный герой обнаруживает что каждый человек хочет плюнуть ему в лицо, с чего бы это?',
    ),
    Movie(
      imageName: AppImages.tower,
      title: 'Папиросы задиры',
      time: '16 октября 2022',
      description:
          'Маг растаман скрутил папиросы которые всех убивают после первой затяжки, кто же справится с этим безумием и что из этого выйдет?',
    ),
    Movie(
      imageName: AppImages.tower,
      title: 'Аркадий',
      time: '25 мая 2008',
      description:
          'Человек котрый работае "Прямо и налево" попадет к логопеду, сможет ли он научиться говорить и наконецто купить себе пожрать',
    ),
    Movie(
      imageName: AppImages.tower,
      title: 'Перепела которая перепила',
      time: '17 июня 1993',
      description:
          'Перепёлка по имени Сенди всегда вела праведный образ жизни, но все меняется когда она решила прогулять школный скворечник.',
    ),
  ];

  var filteringMovies = <Movie>[];

  final _searchController = TextEditingController();

  void searchMovies() {
    final query = _searchController.text;
    if (query.isNotEmpty) {
      filteringMovies = _movies.where((Movie movie) {
        return movie.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      filteringMovies = _movies;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    filteringMovies = _movies;
    _searchController.addListener(searchMovies);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          padding: const EdgeInsets.only(top: 70),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          itemBuilder: (BuildContext context, int index) {
            final movie = filteringMovies[index];
            //этот отступ мы делаем вокруг карточек
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              //стек мы сделали для того, чтобы наложить два виджета друг на друга
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      // withOpacity - с непрозначностью!
                      // для более легкого восприятия перефразирую это лучше как - с прозрачностью.
                      // Как по мне, так намного лучше воспринимается на русский лад!
                      // Здесь мы используем Color  с прозрачностью, от 0 до 1.
                      border: Border.all(color: Colors.black.withOpacity(0.2)),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    //У Container есть такое свойство как Clip
                    //Clip - содержит различные способы обрезки содержимого виджета.
                    //В данном случае мы закруглили края виджета, содержащего Image!
                    clipBehavior: Clip.hardEdge,
                    child: Row(
                      children: [
                        Image(image: AssetImage(movie.imageName)),
                        //это простой отступ
                        const SizedBox(width: 15.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20.0),
                              Text(
                                movie.title,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 5.0),
                              Text(
                                movie.time,
                                style: const TextStyle(color: Colors.grey),
                              ),
                              const SizedBox(height: 20.0),
                              Text(
                                movie.description,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              )
                              //
                            ],
                          ),
                        ),
                        const SizedBox(width: 10.0)
                      ],
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10.0),
                      onTap: () {
                        log('on tap message');
                      },
                    ),
                  ),
                ],
              ),
            );
          },
          itemCount: filteringMovies.length,
          //Задаём высоту виджета
          itemExtent: 163,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              labelText: 'search',
              filled: true,
              fillColor: Colors.white.withAlpha(235),
              border: const OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}

//19 минута
