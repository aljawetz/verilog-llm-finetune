`timescale 1ns/1ps

module tb_good_mux;

    // Inputs
    reg i0;
    reg i1;
    reg sel;

    // Output
    wire y;

    // Instantiate the Unit Under Test (UUT)
    good_mux uut (
        .i0(i0),
        .i1(i1),
        .sel(sel),
        .y(y)
    );

    initial begin
        // Test case 1: sel = 0, expect y = i0
        i0 = 1'b0; 
        i1 = 1'b1; 
        sel = 1'b0; 
        #10;
        if (y !== i0) begin
            $display("FAIL: Test case 1 failed, expected y = %b, got y = %b", i0, y);
            $finish;
        end

        // Test case 2: sel = 1, expect y = i1
        i0 = 1'b0; 
        i1 = 1'b1; 
        sel = 1'b1; 
        #10;
        if (y !== i1) begin
            $display("FAIL: Test case 2 failed, expected y = %b, got y = %b", i1, y);
            $finish;
        end

        // Test case 3: sel = 0, expect y = i0 (changing inputs)
        i0 = 1'b1; 
        i1 = 1'b0; 
        sel = 1'b0; 
        #10;
        if (y !== i0) begin
            $display("FAIL: Test case 3 failed, expected y = %b, got y = %b", i0, y);
            $finish;
        end

        // Test case 4: sel = 1, expect y = i1 (changing inputs)
        i0 = 1'b1; 
        i1 = 1'b0; 
        sel = 1'b1; 
        #10;
        if (y !== i1) begin
            $display("FAIL: Test case 4 failed, expected y = %b, got y = %b", i1, y);
            $finish;
        end

        // Test case 5: sel = 0, expect y = i0 (both inputs same)
        i0 = 1'b1; 
        i1 = 1'b1; 
        sel = 1'b0; 
        #10;
        if (y !== i0) begin
            $display("FAIL: Test case 5 failed, expected y = %b, got y = %b", i0, y);
            $finish;
        end

        // Test case 6: sel = 1, expect y = i1 (both inputs same)
        i0 = 1'b1; 
        i1 = 1'b1; 
        sel = 1'b1; 
        #10;
        if (y !== i1) begin
            $display("FAIL: Test case 6 failed, expected y = %b, got y = %b", i1, y);
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule