function Matrix_Manipulation = Task01()
      A= input("Enter Matrix A: ");
      B= input("Enter Matrix B: ");
      A_max=max((A(:)));
      fprintf("Maximum value in Matrix A is : %d\n",A_max);

      if size(A, 2) == size(B,1)
            result_Matrix = A * B;
            fprintf("Multiplication of A & B is: \n");
            disp(result_Matrix);

      else
            disp("A & B are not Multiplicable.\n");
      end
endfunction

