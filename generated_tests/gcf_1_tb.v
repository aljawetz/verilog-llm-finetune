`timescale 1ns/1ps

module tb_gcf;
    reg [15:0] a;
    reg [15:0] b;
    wire [15:0] res;

    // Instantiate the module under test (uut)
    gcf uut (
        .a(a),
        .b(b),
        .res(res)
    );

    initial begin
        // Test case 1: GCF of 48 and 18
        a = 16'd48; 
        b = 16'd18; 
        #10;
        if (res !== 16'd6) begin
            $display("FAIL: Expected GCF(48, 18) = 6, got %d", res);
            $finish;
        end

        // Test case 2: GCF of 101 and 10
        a = 16'd101; 
        b = 16'd10; 
        #10;
        if (res !== 16'd1) begin
            $display("FAIL: Expected GCF(101, 10) = 1, got %d", res);
            $finish;
        end

        // Test case 3: GCF of 0 and 5
        a = 16'd0; 
        b = 16'd5; 
        #10;
        if (res !== 16'd5) begin
            $display("FAIL: Expected GCF(0, 5) = 5, got %d", res);
            $finish;
        end

        // Test case 4: GCF of 5 and 0
        a = 16'd5; 
        b = 16'd0; 
        #10;
        if (res !== 16'd5) begin
            $display("FAIL: Expected GCF(5, 0) = 5, got %d", res);
            $finish;
        end

        // Test case 5: GCF of 0 and 0
        a = 16'd0; 
        b = 16'd0; 
        #10;
        if (res !== 16'd0) begin
            $display("FAIL: Expected GCF(0, 0) = 0, got %d", res);
            $finish;
        end

        // Test case 6: GCF of 100 and 25
        a = 16'd100; 
        b = 16'd25; 
        #10;
        if (res !== 16'd25) begin
            $display("FAIL: Expected GCF(100, 25) = 25, got %d", res);
            $finish;
        end

        // Test case 7: GCF of 17 and 29 (both primes)
        a = 16'd17; 
        b = 16'd29; 
        #10;
        if (res !== 16'd1) begin
            $display("FAIL: Expected GCF(17, 29) = 1, got %d", res);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule