`timescale 1ns/1ps

module tb_register;

    // Parameters
    parameter DataBits = 8;

    // Inputs
    reg [DataBits-1:0] data_in;
    reg clock;
    reg write_enable;
    reg bReset;

    // Outputs
    wire [DataBits-1:0] data_out;

    // Instantiate the Unit Under Test (UUT)
    register #(.DataBits(DataBits)) uut (
        .data_in(data_in),
        .data_out(data_out),
        .clock(clock),
        .write_enable(write_enable),
        .bReset(bReset)
    );

    // Clock generation
    initial begin
        clock = 0;
        forever #5 clock = ~clock; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        bReset = 0;
        write_enable = 0;
        data_in = 8'h00;

        // Wait for global reset
        #10;
        
        // Test 1: Asynchronous reset
        bReset = 0; // Assert reset
        #10;
        if (data_out !== 8'h00) begin
            $display("FAIL: Reset did not set output to zero");
            $finish;
        end
        
        // Test 2: Release reset and write data
        bReset = 1; // Release reset
        #10;
        data_in = 8'hA5; // Data to write
        write_enable = 1; // Enable writing
        #10;
        if (data_out !== 8'hA5) begin
            $display("FAIL: Output did not match written data");
            $finish;
        end
        
        // Test 3: Write new data
        data_in = 8'h3C; // New data to write
        #10;
        if (data_out !== 8'h3C) begin
            $display("FAIL: Output did not match new written data");
            $finish;
        end
        
        // Test 4: Disable writing
        write_enable = 0; // Disable writing
        data_in = 8'hFF; // New data to write (should not take effect)
        #10;
        if (data_out !== 8'h3C) begin
            $display("FAIL: Output changed when write_enable was low");
            $finish;
        end
        
        // Test 5: Assert reset again
        bReset = 0; // Assert reset
        #10;
        if (data_out !== 8'h00) begin
            $display("FAIL: Reset did not set output to zero again");
            $finish;
        end
        
        // End of tests
        $display("PASS");
        $finish;
    end

endmodule