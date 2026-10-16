`timescale 1ns/1ps

module tb_nextNonce;

    reg clk;
    reg active;
    reg [31:0] initNonce;
    wire [31:0] nonce;

    // Instantiate the module under test (uut)
    nextNonce uut (
        .clk(clk),
        .active(active),
        .initNonce(initNonce),
        .nonce(nonce)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        active = 0;
        initNonce = 32'hA5A5A5A5; // Example initial nonce
        
        // Wait for a clock edge
        #10;
        
        // Test when inactive
        active = 0;
        #10;
        if (nonce !== initNonce) begin
            $display("FAIL: Nonce did not initialize correctly when inactive");
            $finish;
        end
        
        // Test when active
        active = 1;
        #10;
        if (nonce !== initNonce + 1) begin
            $display("FAIL: Nonce did not increment correctly when active");
            $finish;
        end
        
        // Another clock cycle while active
        #10;
        if (nonce !== initNonce + 2) begin
            $display("FAIL: Nonce did not increment correctly on subsequent active cycle");
            $finish;
        end
        
        // Test going back to inactive
        active = 0;
        #10;
        if (nonce !== initNonce) begin
            $display("FAIL: Nonce did not reset correctly when inactive again");
            $finish;
        end
        
        // Final active test
        active = 1;
        #10;
        if (nonce !== initNonce + 1) begin
            $display("FAIL: Nonce did not increment correctly after reset to inactive");
            $finish;
        end
        
        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule