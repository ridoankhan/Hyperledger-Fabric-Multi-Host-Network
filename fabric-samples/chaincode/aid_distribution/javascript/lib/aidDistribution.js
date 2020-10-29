/*
 * SPDX-License-Identifier: Apache-2.0
 */

"use strict";

const { Contract } = require("fabric-contract-api");

class AidDistribution extends Contract {
    async initLedger(ctx) {
        console.info("============= START : Initialize Ledger ===========");
        const distHistory = [
            {
                sector: "WASH",
                camp: "Kutupalong",
                project: "Satination",
                aid: "Sanitizer",
                quantity: 5000,
                beneficiaries: 3000,
                receipient_count: 2989,
            },
            {
                sector: "WASH",
                camp: "Nayapara",
                project: "Satination",
                aid: "Sanitizer",
                quantity: 800,
                beneficiaries: 640,
                receipient_count: 640,
            },
            {
                sector: "WASH",
                camp: "Kutupalong",
                project: "Satination",
                aid: "Sanitizer",
                quantity: 700,
                beneficiaries: 700,
                receipient_count: 700,
            },
        ];

        for (let i = 0; i < distHistory.length; i++) {
            distHistory[i].docType = "aid";

            await ctx.stub.putState(
                "AID" + i,
                Buffer.from(JSON.stringify(distHistory[i]))
            );
            console.info("Added <--> ", distHistory[i]);
        }
        console.info("============= END : Initialize Ledger ===========");
    }

    async queryAid(ctx, aidNumber) {
        const aidAsBytes = await ctx.stub.getState(aidNumber); // get the car from chaincode state
        if (!aidAsBytes || aidAsBytes.length === 0) {
            throw new Error(`${aidNumber} does not exist`);
        }
        console.log(aidAsBytes.toString());
        return aidAsBytes.toString();
    }

    async createAid(
        ctx,
        aidNumber,
        sector,
        camp,
        project,
        aid,
        quantity,
        beneficiaries,
        receipient_count
    ) {
        console.info("============= START : Create Aid Status ===========");

        const aid_obj = {
            sector,
            camp,
            docType: "aid",
            project,
            aid,
            quantity,
            beneficiaries,
            receipient_count,
        };

        await ctx.stub.putState(
            aidNumber,
            Buffer.from(JSON.stringify(aid_obj))
        );
        console.info("============= END : Create Aid Status ===========");
    }

    async queryAllAids(ctx) {
        const startKey = "AID0";
        const endKey = "AID999";
        const allResults = [];
        for await (const { key, value } of ctx.stub.getStateByRange(
            startKey,
            endKey
        )) {
            const strValue = Buffer.from(value).toString("utf8");
            let record;
            try {
                record = JSON.parse(strValue);
            } catch (err) {
                console.log(err);
                record = strValue;
            }
            allResults.push({ Key: key, Record: record });
        }
        console.info(allResults);
        return JSON.stringify(allResults);
    }

    // async changeCarOwner(ctx, carNumber, newOwner) {
    //     console.info("============= START : changeCarOwner ===========");

    //     const carAsBytes = await ctx.stub.getState(carNumber); // get the car from chaincode state
    //     if (!carAsBytes || carAsBytes.length === 0) {
    //         throw new Error(`${carNumber} does not exist`);
    //     }
    //     const car = JSON.parse(carAsBytes.toString());
    //     car.owner = newOwner;

    //     await ctx.stub.putState(carNumber, Buffer.from(JSON.stringify(car)));
    //     console.info("============= END : changeCarOwner ===========");
    // }

}

module.exports = AidDistribution;
