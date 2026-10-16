`timescale 1ns/1ps

module tb_mtx_arbiter;

    parameter LEN = 3;
    reg clk;
    reg rstn;
    reg [LEN-1:0] request;
    wire [LEN-1:0] grant;
    reg update;

    // Instantiate the module under test (uut)
    mtx_arbiter #(.LEN(LEN)) uut (
        .clk(clk),
        .rstn(rstn),
        .request(request),
        .grant(grant),
        .update(update)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        rstn = 0;
        request = 3'b000;
        update = 0;

        // Reset the DUT
        #10;
        rstn = 1;

        // Test case 1: Single request
        request = 3'b001; // Request 0
        #10;
        if (grant !== 3'b001) $display("FAIL: Test case 1 failed, expected grant 001, got %b", grant);

        // Test case 2: Multiple requests, priority check
        request = 3'b011; // Requests 0 and 1
        #10;
        if (grant !== 3'b001) $display("FAIL: Test case 2 failed, expected grant 001, got %b", grant);

        // Test case 3: Update priority
        update = 1;
        #10;
        update = 0;

        // Check if priority updated correctly
        request = 3'b010; // Request 1
        #10;
        if (grant !== 3'b010) $display("FAIL: Test case 3 failed, expected grant 010, got %b", grant);

        // Test case 4: Disable higher priority
        request = 3'b111; // Requests 0, 1, and 2
        #10;
        if (grant !== 3'b010) $display("FAIL: Test case 4 failed, expected grant 010, got %b", grant);

        // Test case 5: No requests
        request = 3'b000; // No requests
        #10;
        if (grant !== 3'b000) $display("FAIL: Test case 5 failed, expected grant 000, got %b", grant);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule