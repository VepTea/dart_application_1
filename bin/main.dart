import 'package:dart_application_1/dart_application_1.dart'
    as dart_application_1;
import 'dart:io';

bool shopOn = true;

class Product {
  String name = '';
  int price = 0;

  Product(this.name, this.price);
  
  @override
  String toString() {
    return '$name - ${price}원';
}
}


class ShopingMall {
  List<Product> products = [];
  
  showProductList(){
    print(products);
  }
}

void main() {

  Product Pd0 = Product('셔츠', 45000);
  Product Pd1 = Product('원피스', 30000);
  Product Pd2 = Product('반팔티', 35000);
  Product Pd3 = Product('반바지', 38000);
  Product Pd4 = Product('양말', 5000);
//나중에 5번 누르면 상품추가 할수 있는 기능도 만들자.

    ShopingMall shop = ShopingMall(); //쇼핑몰 객체 생성
  shop.products = [Pd0, Pd1, Pd2, Pd3, Pd4]; // 쇼핑몰에 상품 추가
  
  while (shopOn) {
    print('------------------------번호를 입력해보자-------------------------------------');
    print('[1] 상품 목록 보기 / [2] 장바구니에 담기 / [3] 장바구니 금액 합계 / [4]프로그램 종료');
    print('---------------------------------------------------------------------------');
    String? selectNum = stdin.readLineSync(); //이 함수가 반환하는 값과 동일하게 변수 타입을 선언해서 받아주면 됨.
    print('$selectNum를 입력하셨습니다.');
    
    switch (selectNum) {
      case '1':
        print('상품 목록을 보여줍니다.');
        shop.showProductList();
        break;
      case '2':
        print('장바구니에 담을 상품 이름을 입력해주세요!');
        //addToCart();
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
