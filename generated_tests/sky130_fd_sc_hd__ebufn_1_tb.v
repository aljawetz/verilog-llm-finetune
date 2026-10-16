`timescale 1ns/1ps

module tb_sky130_fd_sc_hd__ebufn;

    // Testbench signals
    reg A;
    reg TE_B;
    wire Z;

    // Instantiate the module under test (uut)
    sky130_fd_sc_hd__ebufn uut (
        .Z(Z),
        .A(A),
        .TE_B(TE_B)
    );

    initial begin
        // Initialize inputs
        A = 0;
        TE_B = 1; // Start with TE_B high (high-impedance state)

        // Test case 1: TE_B high, Z should be high-impedance
        #10;
        if (Z !== 1'bz) begin
            $display("FAIL: Expected Z to be high-impedance when TE_B is high");
            $finish;
        end

        // Test case 2: TE_B low, A = 0, Z should follow A
        TE_B = 0;
        #10;
        if (Z !== 1'b0) begin
            $display("FAIL: Expected Z to be 0 when A is 0 and TE_B is low");
            $finish;
        end

        // Test case 3: TE_B low, A = 1, Z should follow A
        A = 1;
        #10;
        if (Z !== 1'b1) begin
            $display("FAIL: Expected Z to be 1 when A is 1 and TE_B is low");
            $finish;
        end

        // Test case 4: TE_B high again, Z should be high-impedance
        TE_B = 1;
        #10;
        if (Z !== 1'bz) begin
            $display("FAIL: Expected Z to be high-impedance when TE_B is high again");
            $finish;
        end

        // All tests passed
        $display("PASS");
        $finish;
    end

endmodule