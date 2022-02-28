function test_hessenberg()
    % Test 1
    A = rand(3);
    R_ = hessenberg(A);
    assert(norm(sort(eig(A)) - sort(eig(R_))) < 1e-4);
    assert(max(abs(tril(R_, -2))) < 1e-4);
    
    % Test 2
    A = rand(5);
    R_ = hessenberg(A);
    assert(norm(sort(eig(A)) - sort(eig(R_))) < 1e-4);
    assert(max(abs(tril(R_, -2))) < 1e-4);
    
    % Test 3
    A = rand(7);
    R_ = hessenberg(A);
    assert(norm(sort(eig(A)) - sort(eig(R_))) < 1e-4);
    assert(max(abs(tril(R_, -2))) < 1e-4);
    
    % Test 4
    A = rand(20);
    R_ = hessenberg(A);
    assert(norm(sort(eig(A)) - sort(eig(R_))) < 1e-4);
    assert(max(abs(tril(R_, -2))) < 1e-4);
    
    % Test 5
    A = rand(3); A = A * A';
    R_ = hessenberg(A);
    assert(norm(sort(eig(A)) - sort(eig(R_))) < 1e-4);
    assert(max(abs(tril(R_, -2))) < 1e-4);
    assert(max(abs(triu(R_, 2))) < 1e-4);
    
    % Test 6
    A = rand(5); A = A * A';
    R_ = hessenberg(A);
    assert(norm(sort(eig(A)) - sort(eig(R_))) < 1e-4);
    assert(max(abs(tril(R_, -2))) < 1e-4);
    assert(max(abs(triu(R_, 2))) < 1e-4);
    
    % Test 7
    A = rand(7); A = A * A';
    R_ = hessenberg(A);
    assert(norm(sort(eig(A)) - sort(eig(R_))) < 1e-4);
    assert(max(abs(tril(R_, -2))) < 1e-4);
    assert(max(abs(triu(R_, 2))) < 1e-4);
    
    % Test 8
    A = rand(20); A = A * A';
    R_ = hessenberg(A);
    assert(norm(sort(eig(A)) - sort(eig(R_))) < 1e-4);
    assert(max(abs(tril(R_, -2))) < 1e-4);
    assert(max(abs(triu(R_, 2))) < 1e-4);
endfunction