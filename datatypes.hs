-- synonyms for redability 
type Authors = [String]
type ISSBN= Int

-- similar to objects 
data BookInfo = Book ISSBN String Authors
                deriving (Show)
data BookReview = Review String Authors
                  deriving (Show)

type BookRecord = (BookInfo, BookReview)

-- instantiation 
myInfo = Book 123 "Algebra of Programming"
         ["Person 1", "Person 2"]
myReview = Review "Super interesting approach to programming." ["Yonathan", "Fisseha"]

-- multiple "constructors"
type CardHolder = String
type CardNumber = String
type Address = [String]

data BillingInfo = CreditCard CardNumber CardHolder Address
                   | CashOnDelivery
                   | Invoice Int
                     deriving (Show)

-- instantiation w/ multiple 'constructors'
billingInfo1 = CreditCard "123 456" "Yonathan Fisseha" ["123 Main St."]
billingInfo2 = CashOnDelivery
billingInfo3 = Invoice 90




