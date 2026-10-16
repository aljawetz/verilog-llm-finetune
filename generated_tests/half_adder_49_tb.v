`timescale 1ns/1ps

module tb_half_adder;

    // Inputs
    reg Data_in_A;
    reg Data_in_B;

    // Outputs
    wire Data_out_Sum;
    wire Data_out_Carry;

    // Instantiate the half_adder module
    half_adder uut (
        .Data_in_A(Data_in_A),
        .Data_in_B(Data_in_B),
        .Data_out_Sum(Data_out_Sum),
        .Data_out_Carry(Data_out_Carry)
    );

    initial begin
        // Test case 1: A = 0, B = 0
        Data_in_A = 0; Data_in_B = 0;
        #10;
        if (Data_out_Sum !== 0 || Data_out_Carry !== 0) begin
            $display("FAIL: Test case 1 failed (0, 0)");
            $finish;
        end

        // Test case 2: A = 0, B = 1
        Data_in_A = 0; Data_in_B = 1;
        #10;
        if (Data_out_Sum !== 1 || Data_out_Carry !== 0) begin
            $display("FAIL: Test case 2 failed (0, 1)");
            $finish;
        end

        // Test case 3: A = 1, B = 0
        Data_in_A = 1; Data_in_B = 0;
        #10;
        if (Data_out_Sum !== 1 || Data_out_Carry !== 0) begin
            $display("FAIL: Test case 3 failed (1, 0)");
            $finish;
        end

        // Test case 4: A = 1, B = 1
        Data_in_A = 1; Data_in_B = 1;
        #10;
        if (Data_out_Sum !== 0 || Data_out_Carry !== 1) begin
            $display("FAIL: Test case 4 failed (1, 1)");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule