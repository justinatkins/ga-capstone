***RUBY***

***HOW IT WORKS

***CONTROL FLOW IN RUBY***

Control flow gives us the flexibility we’re looking for. We can select different outcomes depending on information the user types, the result of a computation, or the value returned by another part of the program.

And
Comparators aren’t the only operators available to you in Ruby. You can also use logical or boolean operators. Ruby has three: and (&&), or (||), and not (!). Boolean operators result in boolean values: true or false.
The boolean operator and, &&, only results in true when bothexpression on either side of &&are true. Here’s how && works:
true && true # => true
true && false # => false
false && true # => false
false && false # => false

Or
Ruby also has the or operator (||). Ruby’s || is called an inclusive or because it evaluates to true when one or the other or both expressions are true. Check it out:
true || true # => true
true || false # => true
false || true # => true
false || false # => false

Not
Finally, Ruby has the boolean operator not (!). ! makes truevalues false, and vice-versa.
!true # => false
!false # => true

Combining Boolean Operators
You can combine boolean operators in your expressions. Combinations like
(x && (y || w)) && z
are not only legal expressions, but are extremely useful tools for your programs.
These expression may take some getting used to, but you can always use parentheses to control the order of evaluation. Expressions in parentheses are always evaluated before anything outside parentheses.

If, Else, and Elsif
All right! You’re all on your lonesome. (Well, not quite. We’ll just leave this example here.)
a = 10
b = 11
if a < b
  print "a is less than b!"
elsif b < a
  print "b is less than a!"
else
  print "b is equal to a!"
end

Unless
Good! Now let’s review the unless statement.
problem = false
print "Good to go!" unless problem
Remember, this is basically a short hand if statement. It will do whatever you ask unless the condition is true. In our example, problem is false, so we don’t have a problem. We print Good to go!


Dare to Compare
Now let’s review comparators / relational operators. We’ve turned the tables a bit!

Remember, comparators need to compare two values to each other to result in true or false

10 > 8 # true
8 > 10 # false
8 == 10 # false
8 != 10 # true
Dare to Compare
Now let’s review comparators / relational operators. We’ve turned the tables a bit!

Remember, comparators need to compare two values to each other to result in true or false

10 > 8 # true
8 > 10 # false
8 == 10 # false
8 != 10 # true


Billions of Booleans
Home stretch! Let’s go over boolean operators.

( 1 == 1 ) && ( 2 == 2 )  # true
( 1 == 2 ) || ( 2 == 2 ) # true
!( false ) # true
With && both comparisons on the left and right must evaluate to true for the entire statement to return true. If the left side does not return true it will not bother trying the right side
With || either the right or left side must evaluate to true. If the left side evaluates to true, the right side will not be tried because it has met the condition of one side being true.
With ! you reverse the result. If you’re false you’re now true. if you’re true you’re now false! Just think of it as opposite day!



















