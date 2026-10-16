`timescale 1ns/1ps

module tb_ad_mux;

    // Inputs
    reg [15:0] addr;
    reg [2:0] S;
    reg [15:0] D_out;

    // Output
    wire [3:0] ad_out;

    // Instantiate the Unit Under Test (UUT)
    ad_mux uut (
        .addr(addr),
        .S(S),
        .D_out(D_out),
        .ad_out(ad_out)
    );

    initial begin
        // Initialize Inputs
        addr = 16'hA5A5; // Example address
        D_out = 16'hF0F0; // Example data output

        // Test case 1: Select lowest nibble of D_out
        S = 3'b000;
        #10;
        if (ad_out !== D_out[3:0]) begin
            $display("FAIL: Test case 1 failed, expected %h, got %h", D_out[3:0], ad_out);
            $finish;
        end

        // Test case 2: Select second nibble of D_out
        S = 3'b001;
        #10;
        if (ad_out !== D_out[7:4]) begin
            $display("FAIL: Test case 2 failed, expected %h, got %h", D_out[7:4], ad_out);
            $finish;
        end

        // Test case 3: Select third nibble of D_out
        S = 3'b010;
        #10;
        if (ad_out !== D_out[11:8]) begin
            $display("FAIL: Test case 3 failed, expected %h, got %h", D_out[11:8], ad_out);
            $finish;
        end

        // Test case 4: Select highest nibble of D_out
        S = 3'b011;
        #10;
        if (ad_out !== D_out[15:12]) begin
            $display("FAIL: Test case 4 failed, expected %h, got %h", D_out[15:12], ad_out);
            $finish;
        end

        // Test case 5: Select lowest nibble of addr
        S = 3'b100;
        #10;
        if (ad_out !== addr[3:0]) begin
            $display("FAIL: Test case 5 failed, expected %h, got %h", addr[3:0], ad_out);
            $finish;
        end

        // Test case 6: Select second nibble of addr
        S = 3'b101;
        #10;
        if (ad_out !== addr[7:4]) begin
            $display("FAIL: Test case 6 failed, expected %h, got %h", addr[7:4], ad_out);
            $finish;
        end

        // Test case 7: Select third nibble of addr
        S = 3'b110;
        #10;
        if (ad_out !== addr[11:8]) begin
            $display("FAIL: Test case 7 failed, expected %h, got %h", addr[11:8], ad_out);
            $finish;
        end

        // Test case 8: Select highest nibble of addr
        S = 3'b111;
        #10;
        if (ad_out !== addr[15:12]) begin
            $display("FAIL: Test case 8 failed, expected %h, got %h", addr[15:12], ad_out);
            $finish;
        end

        // Test case 9: Default case
        S = 3'bxxx; // Invalid selection
        #10;
        if (ad_out !== 4'h0) begin
            $display("FAIL: Default case failed, expected 0, got %h", ad_out);
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule