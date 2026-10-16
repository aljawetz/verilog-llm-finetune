`timescale 1ns/1ps

module tb_black_cell;
    reg Gk_j;
    reg Pi_k;
    reg Gi_k;
    reg Pk_j;
    wire G;
    wire P;

    // Instantiate the module under test (uut)
    black_cell uut (
        .Gk_j(Gk_j),
        .Pi_k(Pi_k),
        .Gi_k(Gi_k),
        .Pk_j(Pk_j),
        .G(G),
        .P(P)
    );

    initial begin
        // Test Case 1: Gk_j = 0, Pi_k = 0, Gi_k = 0, Pk_j = 0
        Gk_j = 0; Pi_k = 0; Gi_k = 0; Pk_j = 0;
        #10;
        if (G !== 0 || P !== 0) begin
            $display("FAIL: Test Case 1 failed");
            $finish;
        end

        // Test Case 2: Gk_j = 0, Pi_k = 1, Gi_k = 0, Pk_j = 0
        Gk_j = 0; Pi_k = 1; Gi_k = 0; Pk_j = 0;
        #10;
        if (G !== 0 || P !== 0) begin
            $display("FAIL: Test Case 2 failed");
            $finish;
        end

        // Test Case 3: Gk_j = 1, Pi_k = 1, Gi_k = 0, Pk_j = 0
        Gk_j = 1; Pi_k = 1; Gi_k = 0; Pk_j = 0;
        #10;
        if (G !== 1 || P !== 0) begin
            $display("FAIL: Test Case 3 failed");
            $finish;
        end

        // Test Case 4: Gk_j = 1, Pi_k = 1, Gi_k = 1, Pk_j = 0
        Gk_j = 1; Pi_k = 1; Gi_k = 1; Pk_j = 0;
        #10;
        if (G !== 1 || P !== 0) begin
            $display("FAIL: Test Case 4 failed");
            $finish;
        end

        // Test Case 5: Gk_j = 0, Pi_k = 1, Gi_k = 1, Pk_j = 1
        Gk_j = 0; Pi_k = 1; Gi_k = 1; Pk_j = 1;
        #10;
        if (G !== 1 || P !== 1) begin
            $display("FAIL: Test Case 5 failed");
            $finish;
        end

        // Test Case 6: Gk_j = 1, Pi_k = 0, Gi_k = 1, Pk_j = 1
        Gk_j = 1; Pi_k = 0; Gi_k = 1; Pk_j = 1;
        #10;
        if (G !== 1 || P !== 0) begin
            $display("FAIL: Test Case 6 failed");
            $finish;
        end

        // Test Case 7: Gk_j = 1, Pi_k = 1, Gi_k = 0, Pk_j = 1
        Gk_j = 1; Pi_k = 1; Gi_k = 0; Pk_j = 1;
        #10;
        if (G !== 1 || P !== 1) begin
            $display("FAIL: Test Case 7 failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule