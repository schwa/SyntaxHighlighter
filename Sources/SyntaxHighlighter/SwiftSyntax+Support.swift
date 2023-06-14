import SwiftSyntax

extension SyntaxEnum {
    enum Meta {
        case token
        case accessesEffect
        case accessorBlock
        case accessorDecl
        case accessorEffectSpecifiers
        case accessorInitEffects
        case accessorList
        case accessorParameter
        case actorDecl
        case arrayElementList
        case arrayElement
        case arrayExpr
        case arrayType
        case arrowExpr
        case asExpr
        case assignmentExpr
        case associatedtypeDecl
        case attributeList
        case attribute
        case attributedType
        case availabilityArgument
        case availabilityCondition
        case availabilityEntry
        case availabilityLabeledArgument
        case availabilitySpecList
        case availabilityVersionRestrictionListEntry
        case availabilityVersionRestrictionList
        case availabilityVersionRestriction
        case awaitExpr
        case backDeployedAttributeSpecList
        case binaryOperatorExpr
        case booleanLiteralExpr
        case borrowExpr
        case breakStmt
        case canImportExpr
        case canImportVersionInfo
        case caseItemList
        case caseItem
        case catchClauseList
        case catchClause
        case catchItemList
        case catchItem
        case classDecl
        case classRestrictionType
        case closureCaptureItemList
        case closureCaptureItemSpecifier
        case closureCaptureItem
        case closureCaptureSignature
        case closureExpr
        case closureParamList
        case closureParam
        case closureParameterClause
        case closureParameterList
        case closureParameter
        case closureSignature
        case codeBlockItemList
        case codeBlockItem
        case codeBlock
        case compositionTypeElementList
        case compositionTypeElement
        case compositionType
        case conditionElementList
        case conditionElement
        case conformanceRequirement
        case constrainedSugarType
        case continueStmt
        case conventionAttributeArguments
        case conventionWitnessMethodAttributeArguments
        case copyExpr
        case declModifierDetail
        case declModifier
        case declNameArgumentList
        case declNameArgument
        case declNameArguments
        case declName
        case deferStmt
        case deinitializerDecl
        case derivativeRegistrationAttributeArguments
        case designatedTypeElement
        case designatedTypeList
        case dictionaryElementList
        case dictionaryElement
        case dictionaryExpr
        case dictionaryType
        case differentiabilityParamList
        case differentiabilityParam
        case differentiabilityParamsClause
        case differentiabilityParams
        case differentiableAttributeArguments
        case discardAssignmentExpr
        case discardStmt
        case doStmt
        case documentationAttributeArgument
        case documentationAttributeArguments
        case dynamicReplacementArguments
        case editorPlaceholderDecl
        case editorPlaceholderExpr
        case effectsArguments
        case enumCaseDecl
        case enumCaseElementList
        case enumCaseElement
        case enumCaseParameterClause
        case enumCaseParameterList
        case enumCaseParameter
        case enumDecl
        case exposeAttributeArguments
        case exprList
        case expressionPattern
        case expressionSegment
        case expressionStmt
        case extensionDecl
        case fallthroughStmt
        case floatLiteralExpr
        case forInStmt
        case forcedValueExpr
        case functionCallExpr
        case functionDecl
        case functionEffectSpecifiers
        case functionParameterList
        case functionParameter
        case functionSignature
        case functionType
        case genericArgumentClause
        case genericArgumentList
        case genericArgument
        case genericParameterClause
        case genericParameterList
        case genericParameter
        case genericRequirementList
        case genericRequirement
        case genericWhereClause
        case guardStmt
        case identifierExpr
        case identifierPattern
        case ifConfigClauseList
        case ifConfigClause
        case ifConfigDecl
        case ifExpr
        case implementsAttributeArguments
        case implicitlyUnwrappedOptionalType
        case importDecl
        case importPathComponent
        case importPath
        case inOutExpr
        case infixOperatorExpr
        case inheritedTypeList
        case inheritedType
        case initializerClause
        case initializerDecl
        case initializesEffect
        case integerLiteralExpr
        case isExpr
        case isTypePattern
        case keyPathComponentList
        case keyPathComponent
        case keyPathExpr
        case keyPathOptionalComponent
        case keyPathPropertyComponent
        case keyPathSubscriptComponent
        case labeledSpecializeEntry
        case labeledStmt
        case layoutRequirement
        case macroDecl
        case macroExpansionDecl
        case macroExpansionExpr
        case matchingPatternCondition
        case memberAccessExpr
        case memberDeclBlock
        case memberDeclListItem
        case memberDeclList
        case memberTypeIdentifier
        case metatypeType
        case missingDecl
        case missingExpr
        case missingPattern
        case missingStmt
        case missing
        case missingType
        case modifierList
        case moveExpr
        case multipleTrailingClosureElementList
        case multipleTrailingClosureElement
        case namedOpaqueReturnType
        case nilLiteralExpr
        case objCSelectorPiece
        case objCSelector
        case opaqueReturnTypeOfAttributeArguments
        case operatorDecl
        case operatorPrecedenceAndTypes
        case optionalBindingCondition
        case optionalChainingExpr
        case optionalType
        case originallyDefinedInArguments
        case packElementExpr
        case packExpansionExpr
        case packExpansionType
        case packReferenceType
        case parameterClause
        case patternBindingList
        case patternBinding
        case postfixIfConfigExpr
        case postfixUnaryExpr
        case poundSourceLocationArgs
        case poundSourceLocation
        case precedenceGroupAssignment
        case precedenceGroupAssociativity
        case precedenceGroupAttributeList
        case precedenceGroupDecl
        case precedenceGroupNameElement
        case precedenceGroupNameList
        case precedenceGroupRelation
        case prefixOperatorExpr
        case primaryAssociatedTypeClause
        case primaryAssociatedTypeList
        case primaryAssociatedType
        case protocolDecl
        case qualifiedDeclName
        case regexLiteralExpr
        case repeatWhileStmt
        case returnClause
        case returnStmt
        case sameTypeRequirement
        case sequenceExpr
        case simpleTypeIdentifier
        case sourceFile
        case specializeAttributeSpecList
        case specializeExpr
        case stringLiteralExpr
        case stringLiteralSegments
        case stringSegment
        case structDecl
        case subscriptDecl
        case subscriptExpr
        case superRefExpr
        case suppressedType
        case switchCaseLabel
        case switchCaseList
        case switchCase
        case switchDefaultLabel
        case switchExpr
        case targetFunctionEntry
        case ternaryExpr
        case throwStmt
        case tryExpr
        case tupleExprElementList
        case tupleExprElement
        case tupleExpr
        case tuplePatternElementList
        case tuplePatternElement
        case tuplePattern
        case tupleTypeElementList
        case tupleTypeElement
        case tupleType
        case typeAnnotation
        case typeEffectSpecifiers
        case typeExpr
        case typeInheritanceClause
        case typeInitializerClause
        case typealiasDecl
        case unavailableFromAsyncArguments
        case underscorePrivateAttributeArguments
        case unexpectedNodes
        case unresolvedAsExpr
        case unresolvedIsExpr
        case unresolvedPatternExpr
        case unresolvedTernaryExpr
        case valueBindingPattern
        case variableDecl
        case versionComponentList
        case versionComponent
        case versionTuple
        case whereClause
        case whileStmt
        case wildcardPattern
        case yieldExprListElement
        case yieldExprList
        case yieldList
        case yieldStmt

    }
}

extension SyntaxEnum.Meta {
    init(_ value: SyntaxEnum) {
        switch value {
        case .token: self = .token
        case .accessesEffect: self = .accessesEffect
        case .accessorBlock: self = .accessorBlock
        case .accessorDecl: self = .accessorDecl
        case .accessorEffectSpecifiers: self = .accessorEffectSpecifiers
        case .accessorInitEffects: self = .accessorInitEffects
        case .accessorList: self = .accessorList
        case .accessorParameter: self = .accessorParameter
        case .actorDecl: self = .actorDecl
        case .arrayElementList: self = .arrayElementList
        case .arrayElement: self = .arrayElement
        case .arrayExpr: self = .arrayExpr
        case .arrayType: self = .arrayType
        case .arrowExpr: self = .arrowExpr
        case .asExpr: self = .asExpr
        case .assignmentExpr: self = .assignmentExpr
        case .associatedtypeDecl: self = .associatedtypeDecl
        case .attributeList: self = .attributeList
        case .attribute: self = .attribute
        case .attributedType: self = .attributedType
        case .availabilityArgument: self = .availabilityArgument
        case .availabilityCondition: self = .availabilityCondition
        case .availabilityEntry: self = .availabilityEntry
        case .availabilityLabeledArgument: self = .availabilityLabeledArgument
        case .availabilitySpecList: self = .availabilitySpecList
        case .availabilityVersionRestrictionListEntry: self = .availabilityVersionRestrictionListEntry
        case .availabilityVersionRestrictionList: self = .availabilityVersionRestrictionList
        case .availabilityVersionRestriction: self = .availabilityVersionRestriction
        case .awaitExpr: self = .awaitExpr
        case .backDeployedAttributeSpecList: self = .backDeployedAttributeSpecList
        case .binaryOperatorExpr: self = .binaryOperatorExpr
        case .booleanLiteralExpr: self = .booleanLiteralExpr
        case .borrowExpr: self = .borrowExpr
        case .breakStmt: self = .breakStmt
        case .canImportExpr: self = .canImportExpr
        case .canImportVersionInfo: self = .canImportVersionInfo
        case .caseItemList: self = .caseItemList
        case .caseItem: self = .caseItem
        case .catchClauseList: self = .catchClauseList
        case .catchClause: self = .catchClause
        case .catchItemList: self = .catchItemList
        case .catchItem: self = .catchItem
        case .classDecl: self = .classDecl
        case .classRestrictionType: self = .classRestrictionType
        case .closureCaptureItemList: self = .closureCaptureItemList
        case .closureCaptureItemSpecifier: self = .closureCaptureItemSpecifier
        case .closureCaptureItem: self = .closureCaptureItem
        case .closureCaptureSignature: self = .closureCaptureSignature
        case .closureExpr: self = .closureExpr
        case .closureParamList: self = .closureParamList
        case .closureParam: self = .closureParam
        case .closureParameterClause: self = .closureParameterClause
        case .closureParameterList: self = .closureParameterList
        case .closureParameter: self = .closureParameter
        case .closureSignature: self = .closureSignature
        case .codeBlockItemList: self = .codeBlockItemList
        case .codeBlockItem: self = .codeBlockItem
        case .codeBlock: self = .codeBlock
        case .compositionTypeElementList: self = .compositionTypeElementList
        case .compositionTypeElement: self = .compositionTypeElement
        case .compositionType: self = .compositionType
        case .conditionElementList: self = .conditionElementList
        case .conditionElement: self = .conditionElement
        case .conformanceRequirement: self = .conformanceRequirement
        case .constrainedSugarType: self = .constrainedSugarType
        case .continueStmt: self = .continueStmt
        case .conventionAttributeArguments: self = .conventionAttributeArguments
        case .conventionWitnessMethodAttributeArguments: self = .conventionWitnessMethodAttributeArguments
        case .copyExpr: self = .copyExpr
        case .declModifierDetail: self = .declModifierDetail
        case .declModifier: self = .declModifier
        case .declNameArgumentList: self = .declNameArgumentList
        case .declNameArgument: self = .declNameArgument
        case .declNameArguments: self = .declNameArguments
        case .declName: self = .declName
        case .deferStmt: self = .deferStmt
        case .deinitializerDecl: self = .deinitializerDecl
        case .derivativeRegistrationAttributeArguments: self = .derivativeRegistrationAttributeArguments
        case .designatedTypeElement: self = .designatedTypeElement
        case .designatedTypeList: self = .designatedTypeList
        case .dictionaryElementList: self = .dictionaryElementList
        case .dictionaryElement: self = .dictionaryElement
        case .dictionaryExpr: self = .dictionaryExpr
        case .dictionaryType: self = .dictionaryType
        case .differentiabilityParamList: self = .differentiabilityParamList
        case .differentiabilityParam: self = .differentiabilityParam
        case .differentiabilityParamsClause: self = .differentiabilityParamsClause
        case .differentiabilityParams: self = .differentiabilityParams
        case .differentiableAttributeArguments: self = .differentiableAttributeArguments
        case .discardAssignmentExpr: self = .discardAssignmentExpr
        case .discardStmt: self = .discardStmt
        case .doStmt: self = .doStmt
        case .documentationAttributeArgument: self = .documentationAttributeArgument
        case .documentationAttributeArguments: self = .documentationAttributeArguments
        case .dynamicReplacementArguments: self = .dynamicReplacementArguments
        case .editorPlaceholderDecl: self = .editorPlaceholderDecl
        case .editorPlaceholderExpr: self = .editorPlaceholderExpr
        case .effectsArguments: self = .effectsArguments
        case .enumCaseDecl: self = .enumCaseDecl
        case .enumCaseElementList: self = .enumCaseElementList
        case .enumCaseElement: self = .enumCaseElement
        case .enumCaseParameterClause: self = .enumCaseParameterClause
        case .enumCaseParameterList: self = .enumCaseParameterList
        case .enumCaseParameter: self = .enumCaseParameter
        case .enumDecl: self = .enumDecl
        case .exposeAttributeArguments: self = .exposeAttributeArguments
        case .exprList: self = .exprList
        case .expressionPattern: self = .expressionPattern
        case .expressionSegment: self = .expressionSegment
        case .expressionStmt: self = .expressionStmt
        case .extensionDecl: self = .extensionDecl
        case .fallthroughStmt: self = .fallthroughStmt
        case .floatLiteralExpr: self = .floatLiteralExpr
        case .forInStmt: self = .forInStmt
        case .forcedValueExpr: self = .forcedValueExpr
        case .functionCallExpr: self = .functionCallExpr
        case .functionDecl: self = .functionDecl
        case .functionEffectSpecifiers: self = .functionEffectSpecifiers
        case .functionParameterList: self = .functionParameterList
        case .functionParameter: self = .functionParameter
        case .functionSignature: self = .functionSignature
        case .functionType: self = .functionType
        case .genericArgumentClause: self = .genericArgumentClause
        case .genericArgumentList: self = .genericArgumentList
        case .genericArgument: self = .genericArgument
        case .genericParameterClause: self = .genericParameterClause
        case .genericParameterList: self = .genericParameterList
        case .genericParameter: self = .genericParameter
        case .genericRequirementList: self = .genericRequirementList
        case .genericRequirement: self = .genericRequirement
        case .genericWhereClause: self = .genericWhereClause
        case .guardStmt: self = .guardStmt
        case .identifierExpr: self = .identifierExpr
        case .identifierPattern: self = .identifierPattern
        case .ifConfigClauseList: self = .ifConfigClauseList
        case .ifConfigClause: self = .ifConfigClause
        case .ifConfigDecl: self = .ifConfigDecl
        case .ifExpr: self = .ifExpr
        case .implementsAttributeArguments: self = .implementsAttributeArguments
        case .implicitlyUnwrappedOptionalType: self = .implicitlyUnwrappedOptionalType
        case .importDecl: self = .importDecl
        case .importPathComponent: self = .importPathComponent
        case .importPath: self = .importPath
        case .inOutExpr: self = .inOutExpr
        case .infixOperatorExpr: self = .infixOperatorExpr
        case .inheritedTypeList: self = .inheritedTypeList
        case .inheritedType: self = .inheritedType
        case .initializerClause: self = .initializerClause
        case .initializerDecl: self = .initializerDecl
        case .initializesEffect: self = .initializesEffect
        case .integerLiteralExpr: self = .integerLiteralExpr
        case .isExpr: self = .isExpr
        case .isTypePattern: self = .isTypePattern
        case .keyPathComponentList: self = .keyPathComponentList
        case .keyPathComponent: self = .keyPathComponent
        case .keyPathExpr: self = .keyPathExpr
        case .keyPathOptionalComponent: self = .keyPathOptionalComponent
        case .keyPathPropertyComponent: self = .keyPathPropertyComponent
        case .keyPathSubscriptComponent: self = .keyPathSubscriptComponent
        case .labeledSpecializeEntry: self = .labeledSpecializeEntry
        case .labeledStmt: self = .labeledStmt
        case .layoutRequirement: self = .layoutRequirement
        case .macroDecl: self = .macroDecl
        case .macroExpansionDecl: self = .macroExpansionDecl
        case .macroExpansionExpr: self = .macroExpansionExpr
        case .matchingPatternCondition: self = .matchingPatternCondition
        case .memberAccessExpr: self = .memberAccessExpr
        case .memberDeclBlock: self = .memberDeclBlock
        case .memberDeclListItem: self = .memberDeclListItem
        case .memberDeclList: self = .memberDeclList
        case .memberTypeIdentifier: self = .memberTypeIdentifier
        case .metatypeType: self = .metatypeType
        case .missingDecl: self = .missingDecl
        case .missingExpr: self = .missingExpr
        case .missingPattern: self = .missingPattern
        case .missingStmt: self = .missingStmt
        case .missing: self = .missing
        case .missingType: self = .missingType
        case .modifierList: self = .modifierList
        case .moveExpr: self = .moveExpr
        case .multipleTrailingClosureElementList: self = .multipleTrailingClosureElementList
        case .multipleTrailingClosureElement: self = .multipleTrailingClosureElement
        case .namedOpaqueReturnType: self = .namedOpaqueReturnType
        case .nilLiteralExpr: self = .nilLiteralExpr
        case .objCSelectorPiece: self = .objCSelectorPiece
        case .objCSelector: self = .objCSelector
        case .opaqueReturnTypeOfAttributeArguments: self = .opaqueReturnTypeOfAttributeArguments
        case .operatorDecl: self = .operatorDecl
        case .operatorPrecedenceAndTypes: self = .operatorPrecedenceAndTypes
        case .optionalBindingCondition: self = .optionalBindingCondition
        case .optionalChainingExpr: self = .optionalChainingExpr
        case .optionalType: self = .optionalType
        case .originallyDefinedInArguments: self = .originallyDefinedInArguments
        case .packElementExpr: self = .packElementExpr
        case .packExpansionExpr: self = .packExpansionExpr
        case .packExpansionType: self = .packExpansionType
        case .packReferenceType: self = .packReferenceType
        case .parameterClause: self = .parameterClause
        case .patternBindingList: self = .patternBindingList
        case .patternBinding: self = .patternBinding
        case .postfixIfConfigExpr: self = .postfixIfConfigExpr
        case .postfixUnaryExpr: self = .postfixUnaryExpr
        case .poundSourceLocationArgs: self = .poundSourceLocationArgs
        case .poundSourceLocation: self = .poundSourceLocation
        case .precedenceGroupAssignment: self = .precedenceGroupAssignment
        case .precedenceGroupAssociativity: self = .precedenceGroupAssociativity
        case .precedenceGroupAttributeList: self = .precedenceGroupAttributeList
        case .precedenceGroupDecl: self = .precedenceGroupDecl
        case .precedenceGroupNameElement: self = .precedenceGroupNameElement
        case .precedenceGroupNameList: self = .precedenceGroupNameList
        case .precedenceGroupRelation: self = .precedenceGroupRelation
        case .prefixOperatorExpr: self = .prefixOperatorExpr
        case .primaryAssociatedTypeClause: self = .primaryAssociatedTypeClause
        case .primaryAssociatedTypeList: self = .primaryAssociatedTypeList
        case .primaryAssociatedType: self = .primaryAssociatedType
        case .protocolDecl: self = .protocolDecl
        case .qualifiedDeclName: self = .qualifiedDeclName
        case .regexLiteralExpr: self = .regexLiteralExpr
        case .repeatWhileStmt: self = .repeatWhileStmt
        case .returnClause: self = .returnClause
        case .returnStmt: self = .returnStmt
        case .sameTypeRequirement: self = .sameTypeRequirement
        case .sequenceExpr: self = .sequenceExpr
        case .simpleTypeIdentifier: self = .simpleTypeIdentifier
        case .sourceFile: self = .sourceFile
        case .specializeAttributeSpecList: self = .specializeAttributeSpecList
        case .specializeExpr: self = .specializeExpr
        case .stringLiteralExpr: self = .stringLiteralExpr
        case .stringLiteralSegments: self = .stringLiteralSegments
        case .stringSegment: self = .stringSegment
        case .structDecl: self = .structDecl
        case .subscriptDecl: self = .subscriptDecl
        case .subscriptExpr: self = .subscriptExpr
        case .superRefExpr: self = .superRefExpr
        case .suppressedType: self = .suppressedType
        case .switchCaseLabel: self = .switchCaseLabel
        case .switchCaseList: self = .switchCaseList
        case .switchCase: self = .switchCase
        case .switchDefaultLabel: self = .switchDefaultLabel
        case .switchExpr: self = .switchExpr
        case .targetFunctionEntry: self = .targetFunctionEntry
        case .ternaryExpr: self = .ternaryExpr
        case .throwStmt: self = .throwStmt
        case .tryExpr: self = .tryExpr
        case .tupleExprElementList: self = .tupleExprElementList
        case .tupleExprElement: self = .tupleExprElement
        case .tupleExpr: self = .tupleExpr
        case .tuplePatternElementList: self = .tuplePatternElementList
        case .tuplePatternElement: self = .tuplePatternElement
        case .tuplePattern: self = .tuplePattern
        case .tupleTypeElementList: self = .tupleTypeElementList
        case .tupleTypeElement: self = .tupleTypeElement
        case .tupleType: self = .tupleType
        case .typeAnnotation: self = .typeAnnotation
        case .typeEffectSpecifiers: self = .typeEffectSpecifiers
        case .typeExpr: self = .typeExpr
        case .typeInheritanceClause: self = .typeInheritanceClause
        case .typeInitializerClause: self = .typeInitializerClause
        case .typealiasDecl: self = .typealiasDecl
        case .unavailableFromAsyncArguments: self = .unavailableFromAsyncArguments
        case .underscorePrivateAttributeArguments: self = .underscorePrivateAttributeArguments
        case .unexpectedNodes: self = .unexpectedNodes
        case .unresolvedAsExpr: self = .unresolvedAsExpr
        case .unresolvedIsExpr: self = .unresolvedIsExpr
        case .unresolvedPatternExpr: self = .unresolvedPatternExpr
        case .unresolvedTernaryExpr: self = .unresolvedTernaryExpr
        case .valueBindingPattern: self = .valueBindingPattern
        case .variableDecl: self = .variableDecl
        case .versionComponentList: self = .versionComponentList
        case .versionComponent: self = .versionComponent
        case .versionTuple: self = .versionTuple
        case .whereClause: self = .whereClause
        case .whileStmt: self = .whileStmt
        case .wildcardPattern: self = .wildcardPattern
        case .yieldExprListElement: self = .yieldExprListElement
        case .yieldExprList: self = .yieldExprList
        case .yieldList: self = .yieldList
        case .yieldStmt: self = .yieldStmt
        }
    }
}
