`timescale 1ns/1ps

module tb_benes_mux;

    parameter W = 16;
    reg [W-1:0] a, b;
    reg sel;
    wire [W-1:0] o;

    // Instantiate the module under test (uut)
    benes_mux #(W) uut (
        .o(o),
        .a(a),
        .b(b),
        .sel(sel)
    );

    initial begin
        // Test case 1: sel = 0, expect output to be a
        a = 16'hAAAA; 
        b = 16'h5555; 
        sel = 0; 
        #10;
        if (o !== a) begin
            $display("FAIL: Test case 1 failed, expected %h but got %h", a, o);
            $finish;
        end

        // Test case 2: sel = 1, expect output to be b
        sel = 1; 
        #10;
        if (o !== b) begin
            $display("FAIL: Test case 2 failed, expected %h but got %h", b, o);
            $finish;
        end

        // Test case 3: Change inputs and sel
        a = 16'hFFFF; 
        b = 16'h0000; 
        sel = 0; 
        #10;
        if (o !== a) begin
            $display("FAIL: Test case 3 failed, expected %h but got %h", a, o);
            $finish;
        end

        sel = 1; 
        #10;
        if (o !== b) begin
            $display("FAIL: Test case 4 failed, expected %h but got %h", b, o);
            $finish;
        end

        // Test case 5: Random values
        a = 16'h1234; 
        b = 16'h5678; 
        sel = 0; 
        #10;
        if (o !== a) begin
            $display("FAIL: Test case 5 failed, expected %h but got %h", a, o);
            $finish;
        end

        sel = 1; 
        #10;
        if (o !== b) begin
            $display("FAIL: Test case 6 failed, expected %h but got %h", b, o);
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule