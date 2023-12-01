fprintf('The equations are:\n 25a1 + 5a2 + a3 = 106.8\n 64a1 + 8a2 + a3 = 177.2\n 144a1 + 12a2 + a3 = 279.2\n');
n = 3;
A = [25, 5, 1; 64, 8, 1; 144, 12, 1];
B = [106.8; 177.2; 279.2];

dett = det(A);
if dett == 0
    fprintf('This system has no solutions\n');
else
    augmentedMatrix = [A B];
    fprintf('The Augmented Matrix is:\n');
    disp(augmentedMatrix);

    % Gaussian Elimination
    for i = 1:n-1
        for j = i+1:n
            factor = augmentedMatrix(j, i) / augmentedMatrix(i, i);
            augmentedMatrix(j, i:end) = augmentedMatrix(j, i:end) - factor * augmentedMatrix(i, i:end);
        end
    end

    fprintf('The Augmented Matrix After Gaussian Elimination is:\n');
    disp(augmentedMatrix);

    % Back-substitution
    solutions = zeros(n, 1);
    for i = n:-1:1
        solutions(i) = (augmentedMatrix(i, end) - augmentedMatrix(i, i+1:n) * solutions(i+1:n)) / augmentedMatrix(i, i);
    end

    fprintf('Solutions are:\n');
    fprintf('a1 = %.4f\n', solutions(1));
    fprintf('a2 = %.4f\n', solutions(2));
    fprintf('a3 = %.4f\n\n', solutions(3));

    fprintf('Hence, v(t) m/s = %.4ft^2 + %.4ft + %.4f\n', solutions(1), solutions(2), solutions(3));

    t = 6;
    velocity = solutions(1) * t^2 + solutions(2) * t + solutions(3);
    fprintf('The velocity at t = 6s is: v(6) = %.4f m/s\n', velocity);
end
