`timescale 1ns/1ps

module tb_comparator_mux;

    reg [3:0] data_input;
    reg [3:0] compare_value;
    reg control;
    wire [3:0] mux_output;

    // Instantiate the module under test (uut)
    comparator_mux uut (
        .data_input(data_input),
        .compare_value(compare_value),
        .control(control),
        .mux_output(mux_output)
    );

    initial begin
        // Test case 1: control = 0, expect mux_output = data_input
        data_input = 4'b1010; 
        compare_value = 4'b1100; 
        control = 0; 
        #10;
        if (mux_output !== data_input) begin
            $display("FAIL: Test case 1 failed, expected %b but got %b", data_input, mux_output);
            $finish;
        end

        // Test case 2: control = 1, expect mux_output = compare_value
        data_input = 4'b0011; 
        compare_value = 4'b1111; 
        control = 1; 
        #10;
        if (mux_output !== compare_value) begin
            $display("FAIL: Test case 2 failed, expected %b but got %b", compare_value, mux_output);
            $finish;
        end

        // Test case 3: control = 0, data_input equals compare_value
        data_input = 4'b0101; 
        compare_value = 4'b0101; 
        control = 0; 
        #10;
        if (mux_output !== data_input) begin
            $display("FAIL: Test case 3 failed, expected %b but got %b", data_input, mux_output);
            $finish;
        end

        // Test case 4: control = 1, data_input does not equal compare_value
        data_input = 4'b1001; 
        compare_value = 4'b0110; 
        control = 1; 
        #10;
        if (mux_output !== compare_value) begin
            $display("FAIL: Test case 4 failed, expected %b but got %b", compare_value, mux_output);
            $finish;
        end

        // Test case 5: control = 0, different data_input
        data_input = 4'b1111; 
        compare_value = 4'b0000; 
        control = 0; 
        #10;
        if (mux_output !== data_input) begin
            $display("FAIL: Test case 5 failed, expected %b but got %b", data_input, mux_output);
            $finish;
        end

        // Test case 6: control = 1, same data_input and compare_value
        data_input = 4'b0000; 
        compare_value = 4'b0000; 
        control = 1; 
        #10;
        if (mux_output !== compare_value) begin
            $display("FAIL: Test case 6 failed, expected %b but got %b", compare_value, mux_output);
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule