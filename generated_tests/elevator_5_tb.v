`timescale 1ns/1ps

module tb_elevator;

    reg clk;
    reg rst;
    reg [4:0] floor_req;
    wire [4:0] floor_pos;

    // Instantiate the elevator module
    elevator uut (
        .clk(clk),
        .rst(rst),
        .floor_req(floor_req),
        .floor_pos(floor_pos)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize
        rst = 1;
        floor_req = 5'b00000;
        #10; // Wait for reset
        rst = 0;

        // Test 1: Request to move to floor 3
        floor_req = 5'b00010; // Request floor 2 (0-indexed)
        #50; // Wait for elevator to reach the requested floor
        if (floor_pos !== 5'b00010) begin
            $display("FAIL: Expected floor_pos 2, got %b", floor_pos);
            $finish;
        end

        // Test 2: Request to move to floor 1
        floor_req = 5'b00001; // Request floor 1
        #50; // Wait for elevator to reach the requested floor
        if (floor_pos !== 5'b00001) begin
            $display("FAIL: Expected floor_pos 1, got %b", floor_pos);
            $finish;
        end

        // Test 3: Request to move to floor 4
        floor_req = 5'b00011; // Request floor 3
        #50; // Wait for elevator to reach the requested floor
        if (floor_pos !== 5'b00011) begin
            $display("FAIL: Expected floor_pos 3, got %b", floor_pos);
            $finish;
        end

        // Test 4: Request to move to floor 0
        floor_req = 5'b00000; // Request floor 0 (no request)
        #10; // Wait for elevator to process no request
        if (floor_pos !== 5'b00011) begin
            $display("FAIL: Expected floor_pos 3, got %b", floor_pos);
            $finish;
        end

        // Test 5: Request to move to floor 4 again
        floor_req = 5'b00011; // Request floor 3 again
        #50; // Wait for elevator to reach the requested floor
        if (floor_pos !== 5'b00011) begin
            $display("FAIL: Expected floor_pos 3, got %b", floor_pos);
            $finish;
        end

        // Final check: No requests
        floor_req = 5'b00000; // No request
        #10; // Wait for elevator to process no request
        if (floor_pos !== 5'b00011) begin
            $display("FAIL: Expected floor_pos 3, got %b", floor_pos);
            $finish;
        end

        $display("PASS");
        $finish;
    end
endmodule