package main

import (
	"fmt"
	"github.com/aws/aws-lambda-go/lambda"
	"github.com/aws/aws-lambda-go/events"	
)

func main() {
	lambda.Start(handler)
}

func handler(request events.APIGatewayProxyRequest) (events.APIGatewayProxyResponse, error) {	
	return events.APIGatewayProxyResponse{
		StatusCode: 201,
		Body:       fmt.Sprintf("Test update lambda"),
	}, nil	
}

