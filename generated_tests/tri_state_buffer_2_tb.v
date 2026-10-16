`timescale 1ns/1ps

module tb_tri_state_buffer;

    reg data_in;
    reg enable;
    wire data_out;

    // Instantiate the tri_state_buffer module
    tri_state_buffer uut (
        .data_in(data_in),
        .enable(enable),
        .data_out(data_out)
    );

    initial begin
        // Initialize inputs
        data_in = 0;
        enable = 0;

        // Test case 1: Enable is low, data_out should be high impedance
        #10;
        if (data_out !== 1'bz) begin
            $display("FAIL: Test case 1 failed, expected high impedance (Z) when enable is low.");
            $finish;
        end

        // Test case 2: Enable is high, data_out should follow data_in
        enable = 1;
        data_in = 1;
        #10;
        if (data_out !== 1) begin
            $display("FAIL: Test case 2 failed, expected data_out to be 1 when data_in is 1 and enable is high.");
            $finish;
        end

        // Test case 3: Change data_in while enable is high
        data_in = 0;
        #10;
        if (data_out !== 0) begin
            $display("FAIL: Test case 3 failed, expected data_out to be 0 when data_in is 0 and enable is high.");
            $finish;
        end

        // Test case 4: Disable the buffer, data_out should be high impedance
        enable = 0;
        #10;
        if (data_out !== 1'bz) begin
            $display("FAIL: Test case 4 failed, expected high impedance (Z) when enable is low.");
            $finish;
        end

        // Test case 5: Enable again and check data_out follows data_in
        enable = 1;
        data_in = 1;
        #10;
        if (data_out !== 1) begin
            $display("FAIL: Test case 5 failed, expected data_out to be 1 when data_in is 1 and enable is high.");
            $finish;
        end

        // All tests passed
        $display("PASS");
        $finish;
    end

endmodule