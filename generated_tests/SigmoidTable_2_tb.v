`timescale 1ns/1ps

module tb_SigmoidTable;

    reg [15:0] x;
    wire [7:0] y;
    
    // Instantiate the module under test
    SigmoidTable uut (
        .x(x),
        .y(y)
    );

    initial begin
        // Test cases
        // Test saturated values
        x = 16'h0000; #10; // Expect y = 8'h10
        if (y !== 8'h10) $display("FAIL: Expected y = 8'h10 for x = 16'h0000, got y = %h", y);

        x = 16'h007F; #10; // Expect y = 8'h1F
        if (y !== 8'h1F) $display("FAIL: Expected y = 8'h1F for x = 16'h007F, got y = %h", y);

        x = 16'h0080; #10; // Expect y = 8'h00
        if (y !== 8'h00) $display("FAIL: Expected y = 8'h00 for x = 16'h0080, got y = %h", y);

        x = 16'hFF80; #10; // Expect y = 8'h20
        if (y !== 8'h20) $display("FAIL: Expected y = 8'h20 for x = 16'hFF80, got y = %h", y);

        x = 16'hFFFF; #10; // Expect y = 8'h00
        if (y !== 8'h00) $display("FAIL: Expected y = 8'h00 for x = 16'hFFFF, got y = %h", y);

        // Test non-saturated values
        x = 16'h0070; #10; // Expect y = 8'h1F
        if (y !== 8'h1F) $display("FAIL: Expected y = 8'h1F for x = 16'h0070, got y = %h", y);

        x = 16'h0071; #10; // Expect y = 8'h1F
        if (y !== 8'h1F) $display("FAIL: Expected y = 8'h1F for x = 16'h0071, got y = %h", y);

        x = 16'h0072; #10; // Expect y = 8'h1F
        if (y !== 8'h1F) $display("FAIL: Expected y = 8'h1F for x = 16'h0072, got y = %h", y);

        x = 16'h0073; #10; // Expect y = 8'h1F
        if (y !== 8'h1F) $display("FAIL: Expected y = 8'h1F for x = 16'h0073, got y = %h", y);

        x = 16'h0074; #10; // Expect y = 8'h1F
        if (y !== 8'h1F) $display("FAIL: Expected y = 8'h1F for x = 16'h0074, got y = %h", y);

        // Test edge cases
        x = 16'h00FF; #10; // Expect y = 8'h10
        if (y !== 8'h10) $display("FAIL: Expected y = 8'h10 for x = 16'h00FF, got y = %h", y);

        x = 16'h01FF; #10; // Expect y = 8'h1F
        if (y !== 8'h1F) $display("FAIL: Expected y = 8'h1F for x = 16'h01FF, got y = %h", y);

        // Final check for all zero input
        x = 16'h0000; #10; // Expect y = 8'h10
        if (y !== 8'h10) $display("FAIL: Expected y = 8'h10 for x = 16'h0000, got y = %h", y);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule