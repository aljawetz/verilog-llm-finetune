`timescale 1ns/1ps

module tb_UDL_Counter;
    parameter BITS = 4;
    reg clk;
    reg rstn;
    reg load;
    reg up;
    reg [BITS - 1 : 0] PI;
    wire [BITS - 1 : 0] Q;

    // Instantiate the UDL_Counter
    UDL_Counter #(BITS) uut (
        .clk(clk),
        .rstn(rstn),
        .load(load),
        .up(up),
        .PI(PI),
        .Q(Q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        rstn = 0; load = 0; up = 0; PI = 0;
        #10;

        // Release reset
        rstn = 1;
        #10;

        // Test loading value
        PI = 4'b1010; load = 1; 
        #10;
        load = 0; // Disable load
        if (Q !== PI) begin
            $display("FAIL: Load operation failed. Expected %b, got %b", PI, Q);
            $finish;
        end

        // Test incrementing
        up = 1; 
        #10;
        if (Q !== 4'b1011) begin
            $display("FAIL: Increment operation failed. Expected %b, got %b", 4'b1011, Q);
            $finish;
        end

        // Test decrementing
        up = 0; 
        #10;
        if (Q !== 4'b1010) begin
            $display("FAIL: Decrement operation failed. Expected %b, got %b", 4'b1010, Q);
            $finish;
        end

        // Test reset functionality
        rstn = 0; 
        #10;
        if (Q !== 0) begin
            $display("FAIL: Reset operation failed. Expected 0, got %b", Q);
            $finish;
        end

        // Test after reset
        rstn = 1; PI = 4'b0011; load = 1; 
        #10;
        load = 0; 
        if (Q !== 4'b0011) begin
            $display("FAIL: Load after reset failed. Expected %b, got %b", 4'b0011, Q);
            $finish;
        end

        // Final increment test
        up = 1; 
        #10;
        if (Q !== 4'b0100) begin
            $display("FAIL: Final increment operation failed. Expected %b, got %b", 4'b0100, Q);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule