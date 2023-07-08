%% Solution for question 2 
method = menu('enter the method that you want to use','muller','bairstow');

if method == 1
    muller();
else
    bairstow();
end
