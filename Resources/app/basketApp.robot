*** Settings ***
Resource  ../po/basket.robot

*** Keywords ***
go to cart page
    basket.go to cart page

verify all products in the basket
    ${count} =  basket.product count in the basket
    FOR  ${index}  IN RANGE  1  ${count+1}
        ${product_name} =  basket.get product name  ${index}
        basket.verify product in the basket  ${product_name}
    END

click proceed to checkout button in the basket
    basket.click proceed to checkout button in the basket

click proceed to checkout button in the address
    basket.click proceed to checkout button in the address

agree term of service
    basket.agree term of service

click proceed to checkout button in the shipping
    basket.click proceed to checkout button in the shipping

confirm order with bank wire
    basket.select bank wire method
    basket.confirm the order
    basket.get reference code
