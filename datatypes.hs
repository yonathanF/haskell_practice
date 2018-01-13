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

-- Pattern matching
bookID  (Book issbn title authors) = issbn
bookTitle (Book id title authors) = title
bookAuthors (Book id title authors) = authors

-- Pattern matching w/ wild cards
bookISSBN (Book issbn _ _ )= issbn

-- this will create a warning ???
bookTitleNew (Book issbn title _) = title

-- remeber to cover all cases when pattern matching. If a case is not covered, it can cause runtime exceptions

-- writing getters and setters is annoying so better way:

data Employee = Employee {
  employeeID :: Int,
  employeeName :: String,
  employeeAddress :: Address
                         } deriving (Show)


employee1 = Employee 1 "Yonathan" ["123 Main Street"] 


-- Parameterised types
-- data Maybe a = Just a | Nothing
data SimpleType a = SimpleConst a | Nothing deriving (Show)

-- we can then create values like
firstType = SimpleConst "hello world of params"

secondType = SimpleConst 1

-- we can also nest things
nested = SimpleConst (SimpleConst "Nested!")

