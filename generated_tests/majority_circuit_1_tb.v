`timescale 1ns/1ps

module tb_majority_circuit;

    reg [4:0] input_vector;
    wire majority_output;

    // Instantiate the module under test (uut)
    majority_circuit uut (
        .input_vector(input_vector),
        .majority_output(majority_output)
    );

    initial begin
        // Test case 1: All inputs are 0
        input_vector = 5'b00000; 
        #10;
        if (majority_output !== 1'b0) begin
            $display("FAIL: Test case 1 failed, expected 0, got %b", majority_output);
            $finish;
        end

        // Test case 2: Four inputs are 1
        input_vector = 5'b11110; 
        #10;
        if (majority_output !== 1'b1) begin
            $display("FAIL: Test case 2 failed, expected 1, got %b", majority_output);
            $finish;
        end

        // Test case 3: Three inputs are 1
        input_vector = 5'b11100; 
        #10;
        if (majority_output !== 1'b1) begin
            $display("FAIL: Test case 3 failed, expected 1, got %b", majority_output);
            $finish;
        end

        // Test case 4: Two inputs are 1
        input_vector = 5'b11000; 
        #10;
        if (majority_output !== 1'b0) begin
            $display("FAIL: Test case 4 failed, expected 0, got %b", majority_output);
            $finish;
        end

        // Test case 5: Five inputs are 1
        input_vector = 5'b11111; 
        #10;
        if (majority_output !== 1'b1) begin
            $display("FAIL: Test case 5 failed, expected 1, got %b", majority_output);
            $finish;
        end

        // Test case 6: One input is 1
        input_vector = 5'b00001; 
        #10;
        if (majority_output !== 1'b0) begin
            $display("FAIL: Test case 6 failed, expected 0, got %b", majority_output);
            $finish;
        end

        // Test case 7: Random case with three inputs high
        input_vector = 5'b10101; 
        #10;
        if (majority_output !== 1'b1) begin
            $display("FAIL: Test case 7 failed, expected 1, got %b", majority_output);
            $finish;
        end

        // Test case 8: Random case with two inputs high
        input_vector = 5'b10010; 
        #10;
        if (majority_output !== 1'b0) begin
            $display("FAIL: Test case 8 failed, expected 0, got %b", majority_output);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule