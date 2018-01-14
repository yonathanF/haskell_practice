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
data SimpleType a = SimpleConst a | Nothin deriving (Show)

-- we can then create values like
firstType = SimpleConst "hello world of params"

secondType = SimpleConst 1

-- we can also nest things
nested = SimpleConst (SimpleConst "Nested!")

-- types can be recursive
data List a = Const a (List a) | Nil deriving (Show)

-- another example of a recursive structure, a b-tree
data BTree a = Node a (BTree a) (BTree a) | Empty  deriving (Show)

-- this recursively converst the List datatype above to a haskell list 
toList (Const b bs) = b : toList(bs)
toList Nil = []

-- error handling with error which halts 
secondEl xs = if null (tail xs)
           then error "List is too short"
           else head (tail xs)

-- ^^^ is too aggressive. Using maybe for more control and expressivness 
betterSecond :: [a] -> Maybe a
betterSecond [] = Nothing
betterSecond xs = if null (tail xs)
                  then Nothing
                  else Just (head (tail xs))

-- we could use pattern matching for better clarity
tidySecond :: [a] -> Maybe a
tidySecond (_:x:_) = Just x
tidySecond _ = Nothing  -- this catches anything that falls through the above pattern

-- local vars in functions! let starts the declaration and in ends it 
lend amount balance = let reserve = 100
                          newBalance = balance - amount
                      in if balance < reserve
                            then Nothing
                            else Just newBalance

-- a strange case of shadowing a param
quux a = let a = "foo"
             in a ++ "eek"

-- a can be anything it wants b/c it is never used
lend2 amount balance = if balance < reserve
                          then Nothing
                               else Just newBalance
                          where reserve = 100
                                newBalance = balance - amount

-- define vars at the top of a source file to create global vars
exampleGlobalVar = "Random String As An Example"

-- it is also possible to define functions inside functions!
pluralise :: String -> [Int] -> [String]
pluralise word counts = map plural counts
  where plural 0 = "no " ++ word ++ "s"
        plural 1 = "one " ++ word
        plural n = show n ++ " " ++ word ++ "s"

-- guards! Help! haha
lend3 amount balance
    |amount <= 0  = Nothing
    |amount >reserve * 0.5 = Nothing
    |otherwise = Just newBalance
  where reserve = 100
        newBalance = balance - amount 
