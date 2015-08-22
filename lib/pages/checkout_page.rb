class CheckoutPage
  include PageObject

  text_field(:item_qty, :css=> "[class='qty']>input")
  button(:add_to_cart, :css => "[name='add']")
  button(:checkout_cart, :css => "[id='checkout']")


end