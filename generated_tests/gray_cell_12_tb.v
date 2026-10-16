`timescale 1ns/1ps

module tb_gray_cell;
    reg Gk_j;
    reg Pi_k;
    reg Gi_k;
    wire G;

    // Instantiate the module under test
    gray_cell uut (
        .Gk_j(Gk_j),
        .Pi_k(Pi_k),
        .Gi_k(Gi_k),
        .G(G)
    );

    initial begin
        // Test case 1: Gk_j = 0, Pi_k = 0, Gi_k = 0
        Gk_j = 0; Pi_k = 0; Gi_k = 0;
        #10;
        if (G !== 0) $display("FAIL: Test case 1 failed, expected G=0, got G=%b", G);

        // Test case 2: Gk_j = 0, Pi_k = 0, Gi_k = 1
        Gk_j = 0; Pi_k = 0; Gi_k = 1;
        #10;
        if (G !== 1) $display("FAIL: Test case 2 failed, expected G=1, got G=%b", G);

        // Test case 3: Gk_j = 0, Pi_k = 1, Gi_k = 0
        Gk_j = 0; Pi_k = 1; Gi_k = 0;
        #10;
        if (G !== 0) $display("FAIL: Test case 3 failed, expected G=0, got G=%b", G);

        // Test case 4: Gk_j = 0, Pi_k = 1, Gi_k = 1
        Gk_j = 0; Pi_k = 1; Gi_k = 1;
        #10;
        if (G !== 1) $display("FAIL: Test case 4 failed, expected G=1, got G=%b", G);

        // Test case 5: Gk_j = 1, Pi_k = 0, Gi_k = 0
        Gk_j = 1; Pi_k = 0; Gi_k = 0;
        #10;
        if (G !== 0) $display("FAIL: Test case 5 failed, expected G=0, got G=%b", G);

        // Test case 6: Gk_j = 1, Pi_k = 0, Gi_k = 1
        Gk_j = 1; Pi_k = 0; Gi_k = 1;
        #10;
        if (G !== 1) $display("FAIL: Test case 6 failed, expected G=1, got G=%b", G);

        // Test case 7: Gk_j = 1, Pi_k = 1, Gi_k = 0
        Gk_j = 1; Pi_k = 1; Gi_k = 0;
        #10;
        if (G !== 1) $display("FAIL: Test case 7 failed, expected G=1, got G=%b", G);

        // Test case 8: Gk_j = 1, Pi_k = 1, Gi_k = 1
        Gk_j = 1; Pi_k = 1; Gi_k = 1;
        #10;
        if (G !== 1) $display("FAIL: Test case 8 failed, expected G=1, got G=%b", G);

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule