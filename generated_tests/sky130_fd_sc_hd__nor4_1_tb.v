`timescale 1ns/1ps

module tb_sky130_fd_sc_hd__nor4;

    // Inputs
    reg A;
    reg B;
    reg C;
    reg D;

    // Outputs
    wire Y;

    // Instantiate the Unit Under Test (UUT)
    sky130_fd_sc_hd__nor4 uut (
        .Y(Y),
        .A(A),
        .B(B),
        .C(C),
        .D(D)
    );

    initial begin
        // Test all combinations of inputs
        // Test case 1: All inputs low
        A = 0; B = 0; C = 0; D = 0;
        #10;
        if (Y !== 1) begin
            $display("FAIL: Test case 1 failed, expected Y=1, got Y=%b", Y);
            $finish;
        end

        // Test case 2: One input high
        A = 1; B = 0; C = 0; D = 0;
        #10;
        if (Y !== 0) begin
            $display("FAIL: Test case 2 failed, expected Y=0, got Y=%b", Y);
            $finish;
        end

        // Test case 3: Two inputs high
        A = 1; B = 1; C = 0; D = 0;
        #10;
        if (Y !== 0) begin
            $display("FAIL: Test case 3 failed, expected Y=0, got Y=%b", Y);
            $finish;
        end

        // Test case 4: Three inputs high
        A = 1; B = 1; C = 1; D = 0;
        #10;
        if (Y !== 0) begin
            $display("FAIL: Test case 4 failed, expected Y=0, got Y=%b", Y);
            $finish;
        end

        // Test case 5: All inputs high
        A = 1; B = 1; C = 1; D = 1;
        #10;
        if (Y !== 0) begin
            $display("FAIL: Test case 5 failed, expected Y=0, got Y=%b", Y);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule