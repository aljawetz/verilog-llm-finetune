`timescale 1ns/1ps

module tb_concatenador;
    reg clk;
    reg [95:0] payload;
    reg active;
    reg [31:0] nonce;
    wire [127:0] bloque;

    // Instantiate the module under test (uut)
    concatenador uut (
        .clk(clk),
        .payload(payload),
        .active(active),
        .nonce(nonce),
        .bloque(bloque)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Test case 1: active high, should concatenate
        active = 1;
        payload = 96'hAABBCCDDEEFF001122334455; // Example payload
        nonce = 32'h11223344; // Example nonce
        #10; // Wait for one clock cycle
        if (bloque !== {payload, nonce}) begin
            $display("FAIL: Expected bloque = %h, got %h", {payload, nonce}, bloque);
            $finish;
        end

        // Test case 2: active low, should reset to zero
        active = 0;
        #10; // Wait for one clock cycle
        if (bloque !== 128'h0) begin
            $display("FAIL: Expected bloque = 0, got %h", bloque);
            $finish;
        end

        // Test case 3: active high again, should concatenate
        active = 1;
        payload = 96'hFFFFFFFFFFFFFFFFFFFFFFFF; // New payload
        nonce = 32'hFFFFFFFF; // New nonce
        #10; // Wait for one clock cycle
        if (bloque !== {payload, nonce}) begin
            $display("FAIL: Expected bloque = %h, got %h", {payload, nonce}, bloque);
            $finish;
        end

        // Test case 4: active low again, should reset to zero
        active = 0;
        #10; // Wait for one clock cycle
        if (bloque !== 128'h0) begin
            $display("FAIL: Expected bloque = 0, got %h", bloque);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule