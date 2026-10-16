`timescale 1ns/1ps

module tb_KSA_Stage7;

    reg [31:0] g_in;
    reg [31:0] p_in;
    reg cin;
    wire [32:0] carry;

    // Instantiate the module under test
    KSA_Stage7 uut (
        .g_in(g_in),
        .p_in(p_in),
        .cin(cin),
        .carry(carry)
    );

    initial begin
        // Test case 1: All generates are 0, propagate is 0, cin is 0
        g_in = 32'h00000000;
        p_in = 32'h00000000;
        cin = 1'b0;
        #10;
        if (carry !== 33'h000000000) $display("FAIL: Test case 1 failed");
        
        // Test case 2: All generates are 0, propagate is 1, cin is 0
        g_in = 32'h00000000;
        p_in = 32'hFFFFFFFF;
        cin = 1'b0;
        #10;
        if (carry !== 33'h000000000) $display("FAIL: Test case 2 failed");

        // Test case 3: All generates are 1, propagate is 0, cin is 0
        g_in = 32'hFFFFFFFF;
        p_in = 32'h00000000;
        cin = 1'b0;
        #10;
        if (carry !== 33'hFFFFFFFFF) $display("FAIL: Test case 3 failed");

        // Test case 4: Random generates and propagates with cin = 1
        g_in = 32'hA5A5A5A5; // Random generate inputs
        p_in = 32'h5A5A5A5A; // Random propagate inputs
        cin = 1'b1;
        #10;
        if (carry[1] !== 1'b1 || carry[2] !== 1'b1 || carry[3] !== 1'b1 || carry[4] !== 1'b1 ||
            carry[5] !== 1'b1 || carry[6] !== 1'b1 || carry[7] !== 1'b1 || carry[8] !== 1'b1 ||
            carry[9] !== 1'b1 || carry[10] !== 1'b1 || carry[11] !== 1'b1 || carry[12] !== 1'b1 ||
            carry[13] !== 1'b1 || carry[14] !== 1'b1 || carry[15] !== 1'b1 || carry[16] !== 1'b1 ||
            carry[17] !== 1'b1 || carry[18] !== 1'b1 || carry[19] !== 1'b1 || carry[20] !== 1'b1 ||
            carry[21] !== 1'b1 || carry[22] !== 1'b1 || carry[23] !== 1'b1 || carry[24] !== 1'b1 ||
            carry[25] !== 1'b1 || carry[26] !== 1'b1 || carry[27] !== 1'b1 || carry[28] !== 1'b1 ||
            carry[29] !== 1'b1 || carry[30] !== 1'b1 || carry[31] !== 1'b1 || carry[32] !== 1'b1) 
            $display("FAIL: Test case 4 failed");

        // Test case 5: Random generates and propagates with cin = 0
        g_in = 32'hA5A5A5A5; // Random generate inputs
        p_in = 32'h5A5A5A5A; // Random propagate inputs
        cin = 1'b0;
        #10;
        if (carry[1] !== 1'b0 || carry[2] !== 1'b0 || carry[3] !== 1'b0 || carry[4] !== 1'b0 ||
            carry[5] !== 1'b0 || carry[6] !== 1'b0 || carry[7] !== 1'b0 || carry[8] !== 1'b0 ||
            carry[9] !== 1'b0 || carry[10] !== 1'b0 || carry[11] !== 1'b0 || carry[12] !== 1'b0 ||
            carry[13] !== 1'b0 || carry[14] !== 1'b0 || carry[15] !== 1'b0 || carry[16] !== 1'b0 ||
            carry[17] !== 1'b0 || carry[18] !== 1'b0 || carry[19] !== 1'b0 || carry[20] !== 1'b0 ||
            carry[21] !== 1'b0 || carry[22] !== 1'b0 || carry[23] !== 1'b0 || carry[24] !== 1'b0 ||
            carry[25] !== 1'b0 || carry[26] !== 1'b0 || carry[27] !== 1'b0 || carry[28] !== 1'b0 ||
            carry[29] !== 1'b0 || carry[30] !== 1'b0 || carry[31] !== 1'b0 || carry[32] !== 1'b0) 
            $display("FAIL: Test case 5 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule