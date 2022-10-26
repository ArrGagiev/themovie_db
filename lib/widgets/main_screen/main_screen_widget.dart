import 'package:flutter/material.dart';
import 'package:themovie_db/resources/resources.dart';
import 'package:themovie_db/widgets/movie_list/movie_list_widget.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  //
  //текущее выбранноя окно, открываемое по нажатию кнопки.
  int _selectedCurrentTab = 0;

  //функция которая при нажатии на определенну кнопку NavigationBar-а
  //считывает индекс этой кнопки и переключает видимый забинженый на этот индекс виджет!
  //Всегда осущаствляется в STF виджете!
  void onSelectTab(int index) {
    //
    //если мы тапнули по одной и той же кнопке подряд, то оставляем индекс неизменным.
    if (_selectedCurrentTab == index) {
      return;
    }
    //
    //а здесь как раз таки происходит сама установка индекса.
    //и соответственно смена виджета по задаваемому индексу
    setState(() {
      _selectedCurrentTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TMDB'),
      ),

      //тут мы отображаем в центре боди, виджет с текущим выбранным индексом.
      body: IndexedStack(
        index: _selectedCurrentTab,
        children: [
          const Text('4oto'),
          MovieListWidget(), //страница фильмов
          const Text('Serials'),
        ],
      ),

      //А это собственно и есть сам NavigationBar с иконками и подписями к ним.
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedCurrentTab,
        //Определяет внешний вид элементов кнопок, расположенных в нижней панели навигации.
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'Movies',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tv),
            label: 'Serials',
          ),
        ],
        //
        /* onTap - Вызывается при нажатии на один из [элементов].
        Виджет с отслеживанием состояния, который создает нижнюю панель навигации, 
        должен отслеживать индекс выбранного [BottomNavigationBarItem] и вызывать setState,
        чтобы перестроить нижнюю панель навигации с новым [currentIndex]. */
        onTap: onSelectTab,
      ),
    );
  }
}
