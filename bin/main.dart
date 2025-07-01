import 'package:dart_application_1/dart_application_1.dart'
    as dart_application_1;
import 'dart:io';

class Product {
  //상품 클래스
  String name;
  int price;

  Product(this.name, this.price);
}

class ShopingMall {
  //쇼핑몰 클래스
  List<Product> productList = []; // 쇼핑몰에 있는 상품 목록
  List<Product> cart = []; // 장바구니에 담긴 상품 목록

  showProductList() {
    //이거 for-in문으로 바꿔야함.변수를 사용하지 않으면서 Collection의 요소를 순회할 때 사용
    for (Product product in productList) {
      print(product.name + '/ ' + product.price.toString() + '원');
    }
  }

  addToCart() {
    print('담을 상품 이름을 입력해주세요!');
    String? SelectedProduct = stdin.readLineSync(); //입력값을 받을 경우에는 항상 아무것도 안들어왔을 null의 경우를 감안해야함!!

    //1.(SelectedProduct가 productList에 요소로 있다면) true: 상품 갯수를 입력받는다. false: '다시 입력해주세요'출력하고
    if (productList.any((p) => p.name == SelectedProduct)) {
      print('$SelectedProduct, 확인했습니다.');
      print('$SelectedProduct 몇개를 담으시겠습니까?');
      String? countInput = stdin.readLineSync();
      //갯수를 null, 숫자 아닌걸로 입력했다면 true: int 타입으로 바꿔주고 담았다고 출력한다. false: 다시적으라 한다. 
      if (countInput is String) {
        try {
          int.parse(countInput);
          print('$SelectedProduct $countInput 개를 장바구니에 담았습니다.');
        } catch (e) {
          print('숫자 똑바로 적으세요');
        }
      } else {
        print('아무것도 안치셨어요');
      }
    } else {
      print('$SelectedProduct라는 건 없습니다. 정확한 상품 이름을 입력해주세요.');
    }

    //1.상품 이름이 올바른지 확인
    //2.갯수가 올바른지 확인.
  }
}

bool shopOn = true;
void main() {
  //나중에 5번 누르면 상품추가 할수 있는 기능도 만들자.

  ShopingMall shop = ShopingMall(); //쇼핑몰 객체 생성
  shop.productList = [
    Product('shirt', 45000),
    Product('onepiece', 30000),
    Product('T-shirt', 35000),
    Product('short', 38000),
    Product('socks', 5000),
  ]; // 쇼핑몰에 상품 추가

  while (shopOn) {
    print(
      '------------------------번호를 입력해보자-------------------------------------',
    );
    print('[1] 상품 목록 보기 / [2] 장바구니에 담기 / [3] 장바구니 금액 합계 / [4]프로그램 종료');
    print(
      '---------------------------------------------------------------------------',
    );
    String? selectNum = stdin
        .readLineSync(); //이 함수가 반환하는 값과 동일하게 변수 타입을 선언해서 받아주면 됨.
    print('$selectNum를 입력하셨습니다.');

    switch (selectNum) {
      case '1':
        print('상품 목록을 보여줍니다.');
        shop.showProductList();
        break;
      case '2':
        print('장바구니에 담을 상품 이름을 입력해주세요!');
        shop.addToCart();
        break;
      case '3':
        print('장바구니 금액 합계 총 ::::원 어치 담겨 있습니다');
        //showTotalPrice();
        break;
      case '4':
        print('프로그램을 종료합니다.');
        shopOn = false;
        break;
      default:
        print('잘못된 입력입니다. 다시 시도해주세요.');
    }
  }
}
